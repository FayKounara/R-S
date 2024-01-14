<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page errorPage="appError.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>
            RnS Payment
        </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.8">
        <link href="logo.jpg" rel="icon">
        <link rel="stylesheet" type="text/css" href="r&s.css">
        <!-- FontAwesome CSS link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        
    </head>
<body>

    <%if (session.getAttribute("authenticated_user")!=null){
    User user = (User) session.getAttribute("authenticated_user");
    int user_id=user.getId();%>

    <div class="content">
        <div id="abc">
            <nav style="height: 100px;">
                <ul>
                    <li><a href="Homepage.jsp">Home</a></li>
                    <li><a href="profile.jsp">Notifications</a></li>
                    <li><a href="Upload.jsp">Upload</a></li>
                    <%if (session.getAttribute("authenticated_user")==null){%>
                        <li><a href="Login.jsp">Login/Sign-up</a></li>
                    <%}else{
                        User usernav = (User) session.getAttribute("authenticated_user");
                        String fname = usernav.getFirstname();%>
                        <li><a href="#">Logged in as:<%=fname%></a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    <%}%>
                    
                </ul>
            </nav>
        </div>


           
                
                    <div class="col-lg-12">
                        <%
                        ArrayList<String> errors = (ArrayList<String>) request.getAttribute("error");
                        if (errors != null && errors.size() > 0) {%>
                            <div class="alert alert-danger custom-alert" role="alert">
                                <br>
                                <%for (String error : errors) {%>      
                                    <center>
                                        <%= error %>
                                    </center>
                                <%}%>
                            </div>
                            
                        <%}else if (errors != null && errors.size() <= 0) {%>
                           
                                
                                        <div class="alert alert-danger custom-alert" role="alert">
                                            <center> Payment completed successfully. </center>
                                        </div>
                                    
                                     <% try {
                                        String checkin = (String)session.getAttribute("check_in");
                                        String checkout = (String)session.getAttribute("check_out"); 
                                        String apartmentId = (String)session.getAttribute("apartment_id");
                                        int apartid=Integer.parseInt(apartmentId);
                                        Booking book = new Booking();
                                        book.bookApartment(checkin, checkout, apartid, user_id);
                                    } catch (Exception e) {}%>
                            
                        <%}%>
                            
    
                          
                    </div>
                
                     
                
                
                        <br><br><br>
                <form action="paymentController.jsp" method="POST" class="form-horizontal">
                    <div class="Apartment-details">
                        <div class="Details-container">
                            <legend><h3>Payment Details:</h3></legend>
                            <br>
                            <div class="info">
                                <h3>&#x1F6C8;Information</h3>
                                <p>Almost done just fill the obligatory fields below.</p>
                            </div>
                            <br>
                            <div class="label-input-pair">
                                <label for="fname" class="inline">First.Name: </label>
                                <input type="text" id="fname" name="fname">
                                <label for="lname" class="inline" style="margin-left: 7px;">Last.Name:</label>
                                <input type="text" id="lname" name="lname">
                            </div>                            
                            <div class="label-input-pair">
                                <label for="email">Email:</label>
                                <input type="text" id="email" name="email">
                            </div>
                        
                        
                            <div data-component="input-phone-country" class="c-input-phone-country" data-phone-country-default="gr">
                                <label for="phone">Phone:</label>
                                <select class="c-input-phone-country__country" tabindex="-1" data-phone-country>
                                    <option value="AW" data-calling-code="297">Aruba +297</option>
                                    <option value="AF" data-calling-code="93">Afghanistan +93</option>
                                    <option value="AL" data-calling-code="355">Albania +355</option>
                                    <option value="DZ" data-calling-code="213">Algeria +213</option>
                                    <option value="AS" data-calling-code="1684">American Samoa +1684</option>
                                    <option value="AD" data-calling-code="376">Andorra +376</option>
                                    <option value="AO" data-calling-code="244">Angola +244</option>
                                    <option value="AI" data-calling-code="1264">Anguilla +1264</option>
                                    <option value="AQ" data-calling-code="672">Antarctica +672</option>
                                    <option value="AG" data-calling-code="1268">Antigua & Barbuda +1268</option>
                                    <option value="AR" data-calling-code="54">Argentina +54</option>
                                    <option value="AM" data-calling-code="374">Armenia +374</option>
                                    <option value="AU" data-calling-code="61">Australia +61</option>
                                    <option value="AT" data-calling-code="43">Austria +43</option>
                                    <option value="AZ" data-calling-code="994">Azerbaijan +994</option>
                                    <option value="BS" data-calling-code="1242">Bahamas +1242</option>
                                    <option value="BH" data-calling-code="973">Bahrain +973</option>
                                    <option value="BD" data-calling-code="880">Bangladesh +880</option>
                                    <option value="BB" data-calling-code="1246">Barbados +1246</option>
                                    <option value="BY" data-calling-code="375">Belarus +375</option>
                                    <option value="BE" data-calling-code="32">Belgium +32</option>
                                    <option value="BZ" data-calling-code="501">Belize +501</option>
                                    <option value="BJ" data-calling-code="229">Benin +229</option>
                                    <option value="BM" data-calling-code="1441">Bermuda +1441</option>
                                    <option value="BT" data-calling-code="975">Bhutan +975</option>
                                    <option value="BO" data-calling-code="591">Bolivia +591</option>
                                    <option value="BQ" data-calling-code="599">Bonaire St Eustatius and Saba +599</option>
                                    <option value="BA" data-calling-code="387">Bosnia and Herzegovina +387</option>
                                    <option value="BW" data-calling-code="267">Botswana +267</option>
                                    <option value="BV" data-calling-code="47">Bouvet Island +47</option>
                                    <option value="BR" data-calling-code="55">Brazil +55</option>
                                    <option value="IO" data-calling-code="246">British Indian Ocean Territory +246</option>
                                    <option value="BN" data-calling-code="673">Brunei Darussalam +673</option>
                                    <option value="BG" data-calling-code="359">Bulgaria +359</option>
                                    <option value="BF" data-calling-code="226">Burkina Faso +226</option>
                                    <option value="BI" data-calling-code="257">Burundi +257</option>
                                    <option value="KH" data-calling-code="855">Cambodia +855</option>
                                    <option value="CM" data-calling-code="237">Cameroon +237</option>
                                    <option value="CA" data-calling-code="1">Canada +1</option>
                                    <option value="CV" data-calling-code="238">Cape Verde +238</option>
                                    <option value="KY" data-calling-code="1345">Cayman Islands +1345</option>
                                    <option value="CF" data-calling-code="236">Central Africa Republic +236</option>
                                    <option value="TD" data-calling-code="235">Chad +235</option>
                                    <option value="CL" data-calling-code="56">Chile +56</option>
                                    <option value="CN" data-calling-code="86">China +86</option>
                                    <option value="CX" data-calling-code="61">Christmas Island +61</option>
                                    <option value="CC" data-calling-code="61">Cocos (K) I. +61</option>
                                    <option value="CO" data-calling-code="57">Colombia +57</option>
                                    <option value="KM" data-calling-code="269">Comoros +269</option>
                                    <option value="CG" data-calling-code="242">Congo +242</option>
                                    <option value="CK" data-calling-code="682">Cook Islands +682</option>
                                    <option value="CR" data-calling-code="506">Costa Rica +506</option>
                                    <option value="HR" data-calling-code="385">Croatia +385</option>
                                    <option value="CU" data-calling-code="53">Cuba +53</option>
                                    <option value="CW" data-calling-code="599">Curaçao +599</option>
                                    <option value="CY" data-calling-code="357">Cyprus +357</option>
                                    <option value="CZ" data-calling-code="420">Czech Republic +420</option>
                                    <option value="CI" data-calling-code="225">Côte d'Ivoire +225</option>
                                    <option value="CD" data-calling-code="243">Democratic Republic of Congo +243</option>
                                    <option value="DK" data-calling-code="45">Denmark +45</option>
                                    <option value="DJ" data-calling-code="253">Djibouti +253</option>
                                    <option value="DM" data-calling-code="1767">Dominica +1767</option>
                                    <option value="DO" data-calling-code="1849">Dominican Republic +1849</option>
                                    <option value="TL" data-calling-code="670">East Timor +670</option>
                                    <option value="EC" data-calling-code="593">Ecuador +593</option>
                                    <option value="EG" data-calling-code="20">Egypt +20</option>
                                    <option value="SV" data-calling-code="503">El Salvador +503</option>
                                    <option value="GQ" data-calling-code="240">Equatorial Guinea +240</option>
                                    <option value="ER" data-calling-code="291">Eritrea +291</option>
                                    <option value="EE" data-calling-code="372">Estonia +372</option>
                                    <option value="SZ" data-calling-code="268">Eswatini +268</option>
                                    <option value="ET" data-calling-code="251">Ethiopia +251</option>
                                    <option value="FK" data-calling-code="500">Falkland Islands (Malvinas) +500</option>
                                    <option value="FO" data-calling-code="298">Faroe Islands +298</option>
                                    <option value="FJ" data-calling-code="679">Fiji +679</option>
                                    <option value="FI" data-calling-code="358">Finland +358</option>
                                    <option value="FR" data-calling-code="33">France +33</option>
                                    <option value="GF" data-calling-code="594">French Guiana +594</option>
                                    <option value="PF" data-calling-code="689">French Polynesia +689</option>
                                    <option value="TF" data-calling-code="596">French Southern Territories +596</option>
                                    <option value="GA" data-calling-code="241">Gabon +241</option>
                                    <option value="GM" data-calling-code="220">Gambia +220</option>
                                    <option value="GE" data-calling-code="995">Georgia +995</option>
                                    <option value="DE" data-calling-code="49">Germany +49</option>
                                    <option value="GH" data-calling-code="233">Ghana +233</option>
                                    <option value="GI" data-calling-code="350">Gibraltar +350</option>
                                    <option value="GR" data-calling-code="30">Greece +30</option>
                                    <option value="GL" data-calling-code="299">Greenland +299</option>
                                    <option value="GD" data-calling-code="1473">Grenada +1473</option>
                                    <option value="GP" data-calling-code="590">Guadeloupe +590</option>
                                    <option value="GU" data-calling-code="1671">Guam +1671</option>
                                    <option value="GT" data-calling-code="502">Guatemala +502</option>
                                    <option value="GG" data-calling-code="44">Guernsey +44</option>
                                    <option value="GN" data-calling-code="224">Guinea +224</option>
                                    <option value="GW" data-calling-code="245">Guinea-Bissau +245</option>
                                    <option value="GY" data-calling-code="592">Guyana +592</option>
                                    <option value="HT" data-calling-code="509">Haiti +509</option>
                                    <option value="HM" data-calling-code="692">Heard and McDonald Islands +692</option>
                                    <option value="HN" data-calling-code="504">Honduras +504</option>
                                    <option value="HK" data-calling-code="852">Hong Kong +852</option>
                                    <option value="HU" data-calling-code="36">Hungary +36</option>
                                    <option value="IS" data-calling-code="354">Iceland +354</option>
                                    <option value="IN" data-calling-code="91">India +91</option>
                                    <option value="ID" data-calling-code="62">Indonesia +62</option>
                                    <option value="IR" data-calling-code="98">Iran +98</option>
                                    <option value="IQ" data-calling-code="964">Iraq +964</option>
                                    <option value="IE" data-calling-code="353">Ireland +353</option>
                                    <option value="IM" data-calling-code="44">Isle of Man +44</option>
                                    <option value="IL" data-calling-code="972">Israel +972</option>
                                    <option value="IT" data-calling-code="39">Italy +39</option>
                                    <option value="JM" data-calling-code="1876">Jamaica +1876</option>
                                    <option value="JP" data-calling-code="81">Japan +81</option>
                                    <option value="JE" data-calling-code="44">Jersey +44</option>
                                    <option value="JO" data-calling-code="962">Jordan +962</option>
                                    <option value="KZ" data-calling-code="7">Kazakhstan +7</option>
                                    <option value="KE" data-calling-code="254">Kenya +254</option>
                                    <option value="KI" data-calling-code="686">Kiribati +686</option>
                                    <option value="XK" data-calling-code="383">Kosovo +383</option>
                                    <option value="KW" data-calling-code="965">Kuwait +965</option>
                                    <option value="KG" data-calling-code="996">Kyrgyzstan +996</option>
                                    <option value="LA" data-calling-code="856">Laos +856</option>
                                    <option value="LV" data-calling-code="371">Latvia +371</option>
                                    <option value="LB" data-calling-code="961">Lebanon +961</option>
                                    <option value="LS" data-calling-code="266">Lesotho +266</option>
                                    <option value="LR" data-calling-code="231">Liberia +231</option>
                                    <option value="LY" data-calling-code="218">Libya +218</option>
                                    <option value="LI" data-calling-code="423">Liechtenstein +423</option>
                                    <option value="LT" data-calling-code="370">Lithuania +370</option>
                                    <option value="LU" data-calling-code="352">Luxembourg +352</option>
                                    <option value="MO" data-calling-code="853">Macao +853</option>
                                    <option value="MG" data-calling-code="261">Madagascar +261</option>
                                    <option value="MW" data-calling-code="265">Malawi +265</option>
                                    <option value="MY" data-calling-code="60">Malaysia +60</option>
                                    <option value="MV" data-calling-code="960">Maldives +960</option>
                                    <option value="ML" data-calling-code="223">Mali +223</option>
                                    <option value="MT" data-calling-code="356">Malta +356</option>
                                    <option value="MH" data-calling-code="692">Marshall Islands +692</option>
                                    <option value="MQ" data-calling-code="596">Martinique +596</option>
                                    <option value="MR" data-calling-code="222">Mauritania +222</option>
                                    <option value="MU" data-calling-code="230">Mauritius +230</option>
                                    <option value="YT" data-calling-code="269">Mayotte +269</option>
                                    <option value="MX" data-calling-code="52">Mexico +52</option>
                                    <option value="FM" data-calling-code="691">Micronesia +691</option>
                                    <option value="MD" data-calling-code="373">Moldova +373</option>
                                    <option value="MC" data-calling-code="377">Monaco +377</option>
                                    <option value="MN" data-calling-code="976">Mongolia +976</option>
                                    <option value="ME" data-calling-code="382">Montenegro +382</option>
                                    <option value="MS" data-calling-code="1664">Montserrat +1664</option>
                                    <option value="MA" data-calling-code="212">Morocco +212</option>
                                    <option value="MZ" data-calling-code="258">Mozambique +258</option>
                                    <option value="MM" data-calling-code="95">Myanmar +95</option>
                                    <option value="NA" data-calling-code="264">Namibia +264</option>
                                    <option value="NR" data-calling-code="674">Nauru +674</option>
                                    <option value="NP" data-calling-code="977">Nepal +977</option>
                                    <option value="NL" data-calling-code="31">Netherlands +31</option>
                                    <option value="NC" data-calling-code="687">New Caledonia +687</option>
                                    <option value="NZ" data-calling-code="64">New Zealand +64</option>
                                    <option value="NI" data-calling-code="505">Nicaragua +505</option>
                                    <option value="NE" data-calling-code="227">Niger +227</option>
                                    <option value="NG" data-calling-code="234">Nigeria +234</option>
                                    <option value="NU" data-calling-code="683">Niue +683</option>
                                    <option value="NF" data-calling-code="672">Norfolk Island +672</option>
                                    <option value="KP" data-calling-code="850">North Korea +850</option>
                                    <option value="MK" data-calling-code="389">North Macedonia +389</option>
                                    <option value="MP" data-calling-code="1670">Northern Mariana Islands +1670</option>
                                    <option value="NO" data-calling-code="47">Norway +47</option>
                                    <option value="OM" data-calling-code="968">Oman +968</option>
                                    <option value="PK" data-calling-code="92">Pakistan +92</option>
                                    <option value="PW" data-calling-code="680">Palau +680</option>
                                    <option value="PS" data-calling-code="970">Palestinian Territory +970</option>
                                    <option value="PA" data-calling-code="507">Panama +507</option>
                                    <option value="PG" data-calling-code="675">Papua New Guinea +675</option>
                                    <option value="PY" data-calling-code="595">Paraguay +595</option>
                                    <option value="PE" data-calling-code="51">Peru +51</option>
                                    <option value="PH" data-calling-code="63">Philippines +63</option>
                                    <option value="PN" data-calling-code="872">Pitcairn +872</option>
                                    <option value="PL" data-calling-code="48">Poland +48</option>
                                    <option value="PT" data-calling-code="351">Portugal +351</option>
                                    <option value="PR" data-calling-code="1939">Puerto Rico +1939</option>
                                    <option value="QA" data-calling-code="974">Qatar +974</option>
                                    <option value="RE" data-calling-code="262">Reunion +262</option>
                                    <option value="RO" data-calling-code="40">Romania +40</option>
                                    <option value="RU" data-calling-code="7">Russia +7</option>
                                    <option value="RW" data-calling-code="250">Rwanda +250</option>
                                    <option value="BL" data-calling-code="590">Saint Barthelemy +590</option>
                                    <option value="KN" data-calling-code="1869">Saint Kitts and Nevis +1869</option>
                                    <option value="LC" data-calling-code="1758">Saint Lucia +1758</option>
                                    <option value="MF" data-calling-code="590">Saint Martin +590</option>
                                    <option value="VC" data-calling-code="1784">Saint Vincent & Grenadines +1784</option>
                                    <option value="WS" data-calling-code="685">Samoa +685</option>
                                    <option value="SM" data-calling-code="378">San Marino +378</option>
                                    <option value="SA" data-calling-code="966">Saudi Arabia +966</option>
                                    <option value="SN" data-calling-code="221">Senegal +221</option>
                                    <option value="RS" data-calling-code="381">Serbia +381</option>
                                    <option value="SC" data-calling-code="248">Seychelles +248</option>
                                    <option value="SL" data-calling-code="232">Sierra Leone +232</option>
                                    <option value="SG" data-calling-code="65">Singapore +65</option>
                                    <option value="SX" data-calling-code="1721">Sint Maarten +1721</option>
                                    <option value="SK" data-calling-code="421">Slovakia +421</option>
                                    <option value="SI" data-calling-code="386">Slovenia +386</option>
                                    <option value="SB" data-calling-code="677">Solomon Islands +677</option>
                                    <option value="SO" data-calling-code="252">Somalia +252</option>
                                    <option value="ZA" data-calling-code="27">South Africa +27</option>
                                    <option value="GS" data-calling-code="500">South Georgia and the South Sandwi&hellip; +500</option>
                                    <option value="KR" data-calling-code="82">South Korea +82</option>
                                    <option value="SS" data-calling-code="211">South Sudan +211</option>
                                    <option value="ES" data-calling-code="34">Spain +34</option>
                                    <option value="LK" data-calling-code="94">Sri Lanka +94</option>
                                    <option value="SH" data-calling-code="290">St Helena +290</option>
                                    <option value="PM" data-calling-code="508">St Pierre and Miquelon +508</option>
                                    <option value="SD" data-calling-code="249">Sudan +249</option>
                                    <option value="SR" data-calling-code="597">Suriname +597</option>
                                    <option value="SJ" data-calling-code="378">Svalbard & Jan Mayen +378</option>
                                    <option value="SE" data-calling-code="46">Sweden +46</option>
                                    <option value="CH" data-calling-code="41">Switzerland +41</option>
                                    <option value="SY" data-calling-code="963">Syria +963</option>
                                    <option value="ST" data-calling-code="239">São Tomé and Príncipe +239</option>
                                    <option value="TW" data-calling-code="886">Taiwan +886</option>
                                    <option value="TJ" data-calling-code="992">Tajikistan +992</option>
                                    <option value="TZ" data-calling-code="255">Tanzania +255</option>
                                    <option value="TH" data-calling-code="66">Thailand +66</option>
                                    <option value="TG" data-calling-code="228">Togo +228</option>
                                    <option value="TK" data-calling-code="690">Tokelau +690</option>
                                    <option value="TO" data-calling-code="676">Tonga +676</option>
                                    <option value="TT" data-calling-code="1868">Trinidad and Tobago +1868</option>
                                    <option value="TN" data-calling-code="216">Tunisia +216</option>
                                    <option value="TR" data-calling-code="90">Turkey +90</option>
                                    <option value="TM" data-calling-code="993">Turkmenistan +993</option>
                                    <option value="TC" data-calling-code="1649">Turks & Caicos Islands +1649</option>
                                    <option value="TV" data-calling-code="688">Tuvalu +688</option>
                                    <option value="VG" data-calling-code="1284">UK Virgin Islands +1284</option>
                                    <option value="VI" data-calling-code="1340">US Virgin Islands +1340</option>
                                    <option value="UG" data-calling-code="256">Uganda +256</option>
                                    <option value="UA" data-calling-code="380">Ukraine +380</option>
                                    <option value="AE" data-calling-code="971">United Arab Emirates +971</option>
                                    <option value="GB" data-calling-code="44">United Kingdom +44</option>
                                    <option value="US" data-calling-code="1">United States +1</option>
                                    <option value="UM" data-calling-code="1">United States Minor Outlying Islan&hellip; +1</option>
                                    <option value="UY" data-calling-code="598">Uruguay +598</option>
                                    <option value="UZ" data-calling-code="998">Uzbekistan +998</option>
                                    <option value="VU" data-calling-code="678">Vanuatu +678</option>
                                    <option value="VA" data-calling-code="379">Vatican City +379</option>
                                    <option value="VE" data-calling-code="58">Venezuela +58</option>
                                    <option value="VN" data-calling-code="84">Vietnam +84</option>
                                    <option value="WF" data-calling-code="681">Wallis and Futuna +681</option>
                                    <option value="YE" data-calling-code="967">Yemen +967</option>
                                    <option value="ZM" data-calling-code="260">Zambia +260</option>
                                    <option value="ZW" data-calling-code="263">Zimbabwe +263</option>
                                </select>
                                
                            </div>
                            <input id="phone" type="text" name="phone" value="" size="20">
                            
                            <div class="label-input-pair">
                                <label for="card1">Card:</label>
                                <input type="text" id="card1" name="card1">
                            </div>
                            <div class="label-input-pair">
                               
                            </div>
                            <div class="label-input-pair">
                                <label for="cvv">CVV: </label>
                                <input type="password" id="cvv" name="cvv" style="width: 100px;">
                                <label for="expire" class="inline" style="margin-left: 7px;"> Exp.Date:</label>
                                <input type="date" id="expire" name="expire">
                            </div>
                            <br></br>
                            <button type="submit">Submit</button>
                        
                        </div>
                    </div>
              </form> 
                    
                    <br><br><br>
                
            
    </div>     
</div>   
    <div class="footer">
        <p>&copy;2023 RnS Rent and Swap. All rights reserved.</p>
        <div class="social-icons">
            <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
        </div>
    </div>

<% }else{
    request.setAttribute("payment_login","no login");
%>
    <jsp:forward page="Login.jsp" />
<% } %>

</body>
</html>
