package com.Grownited.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "expenses")
public class ExpenseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer expenseId;

    private String title;

    private Float amount;

    private String date;

    private String description;

    /* ================= RELATIONSHIPS ================= */

    @ManyToOne
    @JoinColumn(name = "categoryId")
    private CategoryEntity category;

    @ManyToOne
    @JoinColumn(name = "subCategoryId")
    private SubCategoryEntity subCategory;

    @ManyToOne
    @JoinColumn(name = "vendorId")
    private VendorEntity vendor;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private AccountEntity account;

    @ManyToOne
    @JoinColumn(name = "statusId")
    private StatusEntity status;

    @ManyToOne
    @JoinColumn(name = "userId")
    private UserEntity user;

    /* ================= GETTERS & SETTERS ================= */

    public Integer getExpenseId() {
        return expenseId;
    }

    public void setExpenseId(Integer expenseId) {
        this.expenseId = expenseId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public SubCategoryEntity getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(SubCategoryEntity subCategory) {
        this.subCategory = subCategory;
    }

    public VendorEntity getVendor() {
        return vendor;
    }

    public void setVendor(VendorEntity vendor) {
        this.vendor = vendor;
    }

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }

    public StatusEntity getStatus() {
        return status;
    }

    public void setStatus(StatusEntity status) {
        this.status = status;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
