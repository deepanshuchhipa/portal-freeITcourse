<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <!-- breadcrumb -->
                <section class="ixl-breadcrumb" style="background: url(assets/images/breadcrumb.png);">
                    <div class="container">
                        <div class="ixl-breadcrumb-wrapper">
                            <div class="row">
                                <div class="col-12">
                                    <div class="ixl-breadcrumb">
                                        <h1 class="ixl-heading-xl text-anime-style-2" data-aos="fade-up"
                                            data-aos-delay="400" data-aos-duration="1500">Contact us</h1>
                                        <ul data-aos="fade-up" data-aos-delay="600" data-aos-duration="1500">
                                            <li class="ixl-heading-sm"><a href="index.aspx">Home</a> <i
                                                    class="fa-solid fa-angle-right"></i> </li>
                                            <li class="ixl-heading-sm">Contact</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- contact secton -->
                <section class="pt-120">
                    <div class="container">
                        <div class="ixl-contact-page-wrapper">

    <div class="row">

        <!-- CONTACT FORM -->
        <div class="col-lg-7">

            <div class="ixl-contact-page-form mb-5 mb-lg-0"
                data-aos="fade-up"
                data-aos-duration="1500">

                <h1 class="ixl-heading-xl">
                    Feel free to message
                </h1>

                <p>
                    Aliquam eros justo, posuere loborti viverra
                    lao ullamcorper posuere viverra liquam eros justo.
                </p>

                <div>

                    <div class="row">

                        <!-- NAME -->
                        <div class="col-12 mb-30">

                            <asp:TextBox ID="txtContactName"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Your Name"></asp:TextBox>

                        </div>

                        <!-- EMAIL -->
                        <div class="col-md-6 mb-30">

                            <asp:TextBox ID="txtContactEmail"
                                runat="server"
                                TextMode="Email"
                                CssClass="form-control"
                                placeholder="Email"></asp:TextBox>

                        </div>

                        <!-- PHONE -->
                        <div class="col-md-6 mb-30">

                            <asp:TextBox ID="txtContactPhone"
                                runat="server"
                                CssClass="form-control"
                                MaxLength="10"
                                placeholder="Phone"></asp:TextBox>

                        </div>

                        <!-- MESSAGE -->
                        <div class="col-12 mb-30">

                            <asp:TextBox ID="txtContactMessage"
                                runat="server"
                                TextMode="MultiLine"
                                Rows="6"
                                CssClass="form-control"
                                placeholder="Your Message"></asp:TextBox>

                        </div>

                        <!-- BUTTON -->
                        <div class="col-12">

                            <asp:Button ID="btnContactSubmit"
                                runat="server"
                                Text="Send a Message"
                                CssClass="ixl-contact-btn"
                                OnClick="btnContactSubmit_Click"
                                OnClientClick="return validateContactForm();" />

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <!-- CONTACT INFO -->
        <div class="col-lg-5 d-flex align-items-center">

            <div class="ixl-contact-info-wrapper"
                data-aos="fade-up"
                data-aos-duration="1500"
                data-aos-delay="900">

                <!-- PHONE -->
                <div class="ixl-contact-info-item">

                    <div class="icon">
                        <i class="fa-solid fa-phone"></i>
                    </div>

                    <div class="info">

                        <h2 class="ixl-heading-sm">Phone</h2>

                        <a href="tel:+919829047112">
                            +91 9829047112
                        </a>

                    </div>

                </div>

                <!-- EMAIL -->
                <div class="ixl-contact-info-item">

                    <div class="icon">
                        <i class="fa-solid fa-envelope"></i>
                    </div>

                    <div class="info">

                        <h2 class="ixl-heading-sm">E-mail</h2>

                        <a href="mailto:info@blsonicollege.in">
                            info@blsonicollege.in
                        </a>

                    </div>

                </div>

                <!-- ADDRESS -->
                <div class="ixl-contact-info-item mb-0">

                    <div class="icon">
                        <i class="fa-solid fa-location-dot"></i>
                    </div>

                    <div class="info">

                        <h2 class="ixl-heading-sm">Location</h2>

                        <a href="#">
                            1st and 3rd Floor, GT Tower,
                            Lal Bahadur Shastri Market,
                            Bhilwara Rajasthan
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- VALIDATION SCRIPT -->
<script>

    function validateContactForm() {

        var name =
            document.getElementById('<%= txtContactName.ClientID %>').value.trim();

        var email =
            document.getElementById('<%= txtContactEmail.ClientID %>').value.trim();

        var phone =
            document.getElementById('<%= txtContactPhone.ClientID %>').value.trim();

        var message =
            document.getElementById('<%= txtContactMessage.ClientID %>').value.trim();

        // NAME
        if (name == "") {

            alert("Please enter your name");

            return false;
        }

        // EMAIL
        if (email == "") {

            alert("Please enter your email");

            return false;
        }

        // EMAIL FORMAT
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {

            alert("Please enter valid email");

            return false;
        }

        // PHONE
        if (phone == "") {

            alert("Please enter phone number");

            return false;
        }

        // PHONE VALIDATION
        if (phone.length != 10 || isNaN(phone)) {

            alert("Please enter valid 10 digit mobile number");

            return false;
        }

        // MESSAGE
        if (message == "") {

            alert("Please enter message");

            return false;
        }

        alert("Message submitted successfully");

        return true;
    }

</script>
                    </div>
                </section>

                <!-- maps secton -->
                <div class="pt-120">
                    <div class="container-fluid p-0">
                        <div class="ixl-contact-maps-wrapper">
                            <div class="row">
                                <div class="col-12">
                                    <div class="ixl-contact-map" data-aos="fade-up" data-aos-duration="1500"
                                        data-aos-delay="400">
                                        <iframe
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.9027936221387!2d90.3917183149812!3d23.750903894623736!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8b0876f39ed%3A0x6f63013a4dcb7e11!2sDhaka%2C%20Bangladesh!5e0!3m2!1sen!2sus!4v1695766224865!5m2!1sen!2sus"
                                            style="border:0; width: 100%; height: 450px;" allowfullscreen=""
                                            loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

</asp:Content>

