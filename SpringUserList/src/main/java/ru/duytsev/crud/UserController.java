package ru.duytsev.crud;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ru.duytsev.crud.model.User;
import ru.duytsev.crud.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("index")
	public ModelAndView getList() {
		List<User> userList = userService.listUsers();
		ModelAndView model = new ModelAndView();
		model.addObject("user", new User());
		model.addObject(userList);
		model.setViewName("index");
		return model;
	}

	@RequestMapping("delete")
	public ModelAndView deleteUser(@RequestParam int id) {
		userService.deleteUser(id);
		return new ModelAndView("redirect:index");
	}
	
	@RequestMapping("edit")
	public ModelAndView editUser(@RequestParam int id) {
		User user = userService.getUserById(id);
		return new ModelAndView("edit", "user", user);
	}
	
	@RequestMapping("update")
	public ModelAndView updateUset(@ModelAttribute("user") User user) {
		userService.updateUser(user);
		return new ModelAndView("redirect:index");
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user) {
		userService.addUser(user);;
		return new ModelAndView("redirect:index");
	}
	
}
