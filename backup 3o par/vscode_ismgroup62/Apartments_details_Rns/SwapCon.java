package Apartments_details_Rns;

public class SwapCon {
    private int user_id;
    private int swap_id;
    private int apartment_id;
    private String name;
    private String option_apart;
    private String checkin;
    private String checkout;
    private int apartment_id1;

    public SwapCon(int userId, int apartmentId,int swapId, String name, String optionApart, String checkin, String checkout, int apartmentId1) {
        this.user_id = userId;
        this.apartment_id = apartmentId;
        this.swap_id = swapId; 
        this.name = name;
        this.option_apart = optionApart;
        this.checkin = checkin;
        this.checkout = checkout;
        this.apartment_id1 = apartmentId1;
    }

    public int getUserId() {
        return user_id;
    }

    public void setUserId(int userId) {
        this.user_id = userId;
    }

    public int getApartmentId() {
        return apartment_id;
    }

    public void setApartmentId(int apartmentId) {
        this.apartment_id = apartmentId;
    }

    public int getSwapId() {
        return swap_id;
    }

    public void setSwapId(int swapId) {
        this.swap_id = swapId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOptionApart() {
        return option_apart;
    }

    public void setOptionApart(String optionApart) {
        this.option_apart = optionApart;
    }

    public String getCheckin() {
        return checkin;
    }

    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }

    public String getCheckout() {
        return checkout;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }

    public int getApartmentId1() {
        return apartment_id1;
    }

    public void setApartmentId1(int apartmentId1) {
        this.apartment_id1 = apartmentId1;
    }

}