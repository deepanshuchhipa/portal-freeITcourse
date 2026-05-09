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
                                <div class="col-lg-7">
                                    <div class="ixl-contact-page-form mb-5 mb-lg-0" data-aos="fade-up"
                                        data-aos-duration="1500">
                                        <h1 class="ixl-heading-xl">Feel free to messege</h1>
                                        <p>Aliquam eros justo, posuere loborti viverra lao ullamcorper posuere viverra
                                            liquam eros justo, posuere lobortis non, viverra laoreet </p>
                                        <form action="#">
                                            <div class="row">
                                                <div class="col-12 mb-30">
                                                    <input type="text" placeholder="Your Name" required>
                                                </div>
                                                <div class="col-md-6 mb-30">
                                                    <input type="email" placeholder="Email" required>
                                                </div>
                                                <div class="col-md-6 mb-30">
                                                    <input type="email" placeholder="Phone" required>
                                                </div>
                                                <div class="col-12 mb-30">
                                                    <textarea name="message" rows="6" placeholder="Your Message"
                                                        required></textarea>
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit" class="ixl-contact-btn">Send a
                                                        Message</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-5 d-flex align-items-center">
                                    <div class="ixl-contact-info-wrapper" data-aos="fade-up" data-aos-duration="1500"
                                        data-aos-delay="900">
                                        <div class="ixl-contact-info-item">
                                            <div class="icon">
                                                <i class="fa-solid fa-phone"></i>
                                            </div>
                                            <div class="info">
                                                <h2 class="ixl-heading-sm">Phone</h2>
                                                <a href="tel:(808)555-0111">(808) 555-0111</a>
                                            </div>
                                        </div>
                                        <div class="ixl-contact-info-item">
                                            <div class="icon">
                                                <i class="fa-solid fa-envelope"></i>
                                            </div>
                                            <div class="info">
                                                <h2 class="ixl-heading-sm">E-mail</h2>
                                                <a href="mailto:abc@gmail.com">abc@gmail.com</a>
                                            </div>
                                        </div>
                                        <div class="ixl-contact-info-item mb-0">
                                            <div class="icon">
                                                <i class="fa-solid fa-location-dot"></i>
                                            </div>
                                            <div class="info">
                                                <h2 class="ixl-heading-sm">Localtion</h2>
                                                <a href="#">Dhaka 102, utl 1216, road Dhaka 102, utl 1216 </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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

