package com.example.Springboot1.controller.admin;

import com.example.Springboot1.domain.Role;
import com.example.Springboot1.domain.User;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Springboot1.service.RoleService;
import com.example.Springboot1.service.UploadService;
import com.example.Springboot1.service.UserService;

import jakarta.*;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

// @RestController
// public class UserController {
//     private UserService userService;
//     public UserController(UserService userService){
//         this.userService = userService;
//     }
//     @GetMapping("/")
//     public String getHomePage(){
//          return this.userService.getUserName();
//     }
// }

@Controller
public class UserController {
    private final UserService userService;

    private final UploadService uploadService;

    private final PasswordEncoder passwordEncoder;

    private final RoleService roleService;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder, RoleService roleService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
    }

    @RequestMapping(value = "/admin/user/{id}", method = RequestMethod.GET)
    public String getDetailUser(Model model, @PathVariable Long id) {
        System.out.println("id: " + id);
        User user = this.userService.findById(id);
        model.addAttribute("User", user);
        return "admin/user/detail";
    }

    @RequestMapping(value = "admin/user/update/{id}", method = RequestMethod.GET)
    public String updateUser(Model model, @PathVariable Long id) {
        User user = this.userService.findById(id);
        model.addAttribute("updateUser", user);
        return "admin/user/update-user";
    }

    // table
    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        // model.addAttribute("newUser", new User());
        List<User> listDatabase = this.userService.getAllUsers();
        model.addAttribute("tableUser", listDatabase); // tableUser on view
        return "admin/user/show";
    }

    // call from create = GET
    @RequestMapping("/admin/user/create")
    public String createUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // POST take data for database
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User hoidanit,
            BindingResult newUserBindingResult,
            @RequestParam("inputFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            return "/admin/user/create"; // dung redirect se lm mat du lieu
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(hoidanit.getPassword());
        hoidanit.setAvatar(avatar);
        hoidanit.setPassword(hashPassword);
        hoidanit.setRole(this.roleService.findByName(hoidanit.getRole().getName()));
        // hoidanit.setRole(this.userService.findByName(hoidanit.getRole().getName()));
        this.userService.handleSaveUser(hoidanit);

        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(@ModelAttribute("updateUser") User user,
            @RequestParam("inputFile") MultipartFile file) {
        User currentUser = this.userService.findById(user.getId());
        currentUser.setAddress(user.getAddress());
        currentUser.setPhone(user.getPhone());
        currentUser.setFullName(user.getFullName());
        Role role = this.roleService.findByName(user.getRole().getName());

        currentUser.setRole(role);
        if (!file.isEmpty()) {
            try {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.userService.handleSaveUser(currentUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable Long id) {
        // userService.DeleteById(id);
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete-user";
    }

    @PostMapping("/admin/user/del")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteById(user.getId());
        return "redirect:/admin/user"; // trả về cái bảng

        // quá trình là khi xóa hay tạo mới thì sẽ chạy qua cái dạng controller này
        // controller này sẽ đảm nhận nhiệm vụ xử lý nhận dữ liệu là 1 id hoặc 1 class
        // đối tượng để ròi return qua tabletable list nhận dữ liệu được xử lý từ đây
    }

}
