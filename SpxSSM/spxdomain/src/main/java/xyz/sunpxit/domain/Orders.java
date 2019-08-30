package xyz.sunpxit.domain;

import xyz.sunpx.utlis.ShiftDate;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 订单表
 */
public class Orders implements Serializable {
    private String id;
    private String orderNum;
    private Date orderTime;
    private String orderTimeStr;
    private int orderStatus;
    private String orderStatusStr;
    private int peopleCount;
    private Product product;
    private List<Traveller> travellers;
    private Member member;
    private Integer payType;
    private String payTypeStr;
    private String orderDesc;
    public String getOrderStatusStr() {


            if (orderStatus==0){
                orderStatusStr="未支付";
            }else
            if(orderStatus==1){
                orderStatusStr="已开启";
            }

        return orderStatusStr;
    }

    public void setOrderStatusStr(String orderStatusStr) {
        this.orderStatusStr = orderStatusStr;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id='" + id + '\'' +
                ", orderNum='" + orderNum + '\'' +
                ", orderTime=" + orderTime +
                ", orderTimeStr='" + orderTimeStr + '\'' +
                ", orderStatus=" + orderStatus +
                ", peopleCount=" + peopleCount +
                ", product=" + product +
                ", travellers=" + travellers +
                ", member=" + member +
                ", payType=" + payType +
                ", payTypeStr='" + payTypeStr + '\'' +
                ", orderDesc='" + orderDesc + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderTimeStr() {
    if (orderTime!=null) {
        orderTimeStr = ShiftDate.dateTurnString(orderTime, "yyyy-MM-dd HH:mm");
    }
        return orderTimeStr;
    }

    public void setOrderTimeStr(String orderTimeStr) {
        this.orderTimeStr = orderTimeStr;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(int peopleCount) {
        this.peopleCount = peopleCount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Traveller> getTravellers() {
        return travellers;
    }

    public void setTravellers(List<Traveller> travellers) {
        this.travellers = travellers;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getPayTypeStr() {
        if (payType==0){
            payTypeStr="支付宝";
        }
        else if(payType==1){
            payTypeStr="微信";
        }else if (payType==2){
            payTypeStr="其他";
        }
        return payTypeStr;
    }

    public void setPayTypeStr(String payTypeStr) {
        this.payTypeStr = payTypeStr;
    }

    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Orders)) return false;
        Orders orders = (Orders) o;
        return orderStatus == orders.orderStatus &&
                peopleCount == orders.peopleCount &&
                Objects.equals(id, orders.id) &&
                Objects.equals(orderNum, orders.orderNum) &&
                Objects.equals(orderTime, orders.orderTime) &&
                Objects.equals(orderTimeStr, orders.orderTimeStr) &&
                Objects.equals(orderStatusStr, orders.orderStatusStr) &&
                Objects.equals(product, orders.product) &&
                Objects.equals(travellers, orders.travellers) &&
                Objects.equals(member, orders.member) &&
                Objects.equals(payType, orders.payType) &&
                Objects.equals(payTypeStr, orders.payTypeStr) &&
                Objects.equals(orderDesc, orders.orderDesc);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, orderNum, orderTime, orderTimeStr, orderStatus, orderStatusStr, peopleCount, product, travellers, member, payType, payTypeStr, orderDesc);
    }
}
