package egovframework.example.manage.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.manage.service.ManageService;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Resource
	private ManageMapper manageMapper;
	
}
