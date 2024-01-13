package Apartments_details_Rns;

public class BookingConstructor {
    private String checkin;
    private String checkout;
    private int apartId;
    private int userId;

    public BookingConstructor(String checkin, String checkout, int apartId, int userId) {
        this.checkin = checkin;
        this.checkout = checkout;
        this.apartId = apartId;
        this.userId = userId;
    }

    // Getter methods
    public String getCheckin() {
        return checkin;
    }

    public String getCheckout() {
        return checkout;
    }

    public int getApartId() {
        return apartId;
    }

    public int getUserId() {
        return userId;
    }

    // Setter methods
    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }

    public void setApartId(int apartId) {
        this.apartId = apartId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
    

