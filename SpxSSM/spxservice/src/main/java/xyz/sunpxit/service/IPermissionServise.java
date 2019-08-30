package xyz.sunpxit.service;

import xyz.sunpxit.domain.Permission;

import java.util.List;

public interface IPermissionServise {


    List<Permission> findAll(int f,int e);

    void save(Permission permission);
    public void udelete(String[] ids);
}
