package project.CT271.Laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import project.CT271.Laptopshop.service.OrderService;
import project.CT271.Laptopshop.service.ProductService;
import project.CT271.Laptopshop.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;
    private final ProductService productService;
    private final OrderService orderService;

    public DashboardController(UserService userService, ProductService productService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers", userService.countUser());
        model.addAttribute("countProducts", productService.countProduct());
        model.addAttribute("countOrders", orderService.countOrder());
        return "admin/dashboard/show";
    }
}
