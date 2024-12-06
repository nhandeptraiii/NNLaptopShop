package project.CT271.Laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import project.CT271.Laptopshop.domain.User;
import project.CT271.Laptopshop.service.UploadService;
import project.CT271.Laptopshop.service.UserService;

@Controller
public class UserController {
    // DI: dependency injection
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UploadService uploadService, UserService userService, ServletContext servletContext,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;

    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // List<User> arrUsers = this.userService.getAllUsers();
    // System.out.println(arrUsers);
    // model.addAttribute("nhan", "test");
    // model.addAttribute("nhan", "from controller with model");
    // return "hello";
    // }

    // userpage
    @RequestMapping("/admin/user")
    public String getUserPage(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;

        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());

            } else {

            }
        } catch (Exception e) {

        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<User> users = this.userService.getAllUsers(pageable);
        List<User> listUsers = users.getContent();
        model.addAttribute("users1", listUsers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", users.getTotalPages());

        return "admin/user/show";

    }

    // create
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User nhan,
            BindingResult newUserBindingResult,
            @RequestParam("File") MultipartFile file) {
        // List<FieldError> errors = newUserBindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(">>>>" + error.getField() + " - " +
        // error.getDefaultMessage());
        // }
        // validate
        if (newUserBindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        //
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(nhan.getPassword());
        nhan.setAvatar(avatar);
        nhan.setPassword(hashPassword);
        nhan.setRole(this.userService.getRoleByName(nhan.getRole().getName()));
        // save
        this.userService.handleSaveUser(nhan);
        return "redirect:/admin/user";
    }

    // view
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // update
    @RequestMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUserUpdatePage(Model model, @ModelAttribute("newUser") User nhan,
            @RequestParam("File") MultipartFile file) {
        User currentUser = this.userService.getUserById(nhan.getId());
        if (currentUser != null) {
            if (!file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);
            }
            currentUser.setAddress(nhan.getAddress());
            currentUser.setPhone(nhan.getPhone());
            currentUser.setFullName(nhan.getFullName());
            currentUser.setRole(this.userService.getRoleByName(nhan.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // delete
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUserPage(Model model, @ModelAttribute("newUser") User nhan) {
        this.userService.deleteAUser(nhan.getId());
        return "redirect:/admin/user";
    }
}