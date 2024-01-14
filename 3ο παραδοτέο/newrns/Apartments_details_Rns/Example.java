package Apartments_details_Rns;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Example {

    public Date convertStringToDate(String dateString) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date parsedDate = inputFormat.parse(dateString);
            String formattedDateString = inputFormat.format(parsedDate);
            return inputFormat.parse(formattedDateString);
        } catch (ParseException e) {
            return null;
        }
    }
}
