package com.Grownited.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "incomes")
public class IncomeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer incomeId;

    private String title;

    private String date;

    private String description;

    private Float amount;

    private Integer userId;

    // 🔹 RELATION WITH ACCOUNT
    @ManyToOne
    @JoinColumn(name = "account_id")
    private AccountEntity account;

    // 🔹 RELATION WITH STATUS
    @ManyToOne
    @JoinColumn(name = "status_id")
    private StatusEntity status;

    // ================= GETTERS & SETTERS =================

    public Integer getIncomeId() {
        return incomeId;
    }

    public void setIncomeId(Integer incomeId) {
        this.incomeId = incomeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
}
