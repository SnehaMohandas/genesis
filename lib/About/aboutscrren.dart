import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomeScreen/Homepage.dart';

class AboyScreen extends StatefulWidget {
  const AboyScreen({Key? key}) : super(key: key);

  @override
  State<AboyScreen> createState() => _AboyScreenState();
}

class _AboyScreenState extends State<AboyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                              name: '',
                              code: '',
                            )),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("About US" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Genesis Diamonds is the flagship initiative of DeepakToms Diamonds, a leading gold and diamonds Jewelry group with a strong in-house Jewelry design team that's widely known for their impeccable craftsmanship of creating splendid diamond masterpieces. To this day Genesis continues to build on this successful brand legacy by offering its customers, a very creative collection of exquisite diamond Jewelry."),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Genesis combines cutting-edge technologies with traditional goldsmithing skills passed down through generations from the medieval guilds. This approach gives us the creative freedom to accomplish amazing one-of-a-kind pieces once possible only in your imaginations."),
            ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("   Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),

         ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("General This website with the URL of genesisbydeepaktoms.com (“Website/Site”) is operated by Genesis Diamonds(GENESIS DIAMONDS) (“We/Our/Us”). We value the trust you place in website. That's why we insist upon the highest standards for secure transactions and customer information privacy. We collect your personal information in order to provide and continually improve our products and services. Our privacy policy is suGenesis Diamondsect to change at anytime without notice. To make sure you are aware of any changes, please review this policy periodically. All partners firms and any third party working with us, and who have access to personal information, will be expected to read and comply with this policy. No third party may access or process sensitive personal information held by us without first entering into confidentiality agreement. Personal information User acknowledges that he / she is disclosing User Information voluntarily. Prior to the completion of any registration process on Genesis Diamonds website / mobile application, prior to availing of any Services offered on GENESIS DIAMONDS application, if the user wishes not to disclose any User Information, he / she may refrain from doing so; however, if the user doesn’t provide information that is requested, it is possible that the registration process would be incomplete and / or user may not be able to avail GENESIS DIAMONDS’s Services and purchase online. Non-Personal information GENESIS DIAMONDS may also collect information other than Personal Information from user through the Website when the user visits and / or uses the Website. Such information may be stored in server logs. This Non-Personal Information would not assist GENESIS DIAMONDS to identify user personally. This Non-Personal Information may include: a.User’s geographic location b.Details of user’s telecom service provider or internet service provider c.The type of browser used (Internet Explorer, Firefox, Opera, Google Chrome, etc.) d.The operating system of user’s system / device and the Website user last visited before visiting the Website e.The duration of user’s stay on the Website is also stored in the session along with the date and time of user’s access; Non-Personal Information is collected from various means such as through the use of cookies. GENESIS DIAMONDS may store temporary or permanent ‘cookies' on user’s computer / any device. User can erase or choose to block these cookies from his / her computer / device. User can configure his / her computer's browser to alert him / her when GENESIS DIAMONDS attempts to send a cookie with an option to accept or refuse the cookie. If user has turned cookies off, he / she may be prevented from using certain features of the Website. f.Ads: GENESIS DIAMONDS may use third-party service providers for advertisement and promotion across the internet and sometimes on the Website. GENESIS DIAMONDS may collect Non-Personal "
                  "Information about user’s visits to the Website and user’s interaction with "
                  "GENESIS DIAMONDS’s products on the Website. GENESIS DIAMONDS requests the users to note that Personal Information and Non Personal Information may be treated differently as per this Privacy Policy. Usage of the information collected a.We use the information we collect primarily to provide, maintain, protect, and improve our product and services. b.We use the information collected through this website as described in this policy and we may use the information to: i.Improve our services, site and how we operate our business; ii.Understand and enhance website user experience, product, and services; iii.Personalize product and services and make recommendations; iv.Deliver product and services upon request; v.Process, manage, complete, and account for transactions; vi.Provide customer support and respond to your requests, comments, and inquiries; vii.Create and manage online account on website; viii.Send related information, including confirmations, invoices, technical notices, updates, security alerts, and support and administrative messages; ix.Communicate about promotions, upcoming events, and news about products and services; x.We may process"
                  " personal information with or without consent where required by applicable law or regulations for the purposes of verification of identity or for prevention, detection, or investigation, including of cyber incidents, prosecution, and punishment and offences; xi.Protect, investigate, and deter against fraudulent, unauthorized, or illegal activity. Links to third party websites Links to third party e-commerce web sites, third-party advertisements, third-party websites or any third party electronic communication service may be provided on the Website which are operated by third parties and are not controlled by, or affiliated to, or associated with, GENESIS DIAMONDS unless expressly specified on the Website. Genesis Diamondsis not responsible for any form of transmission, whatsoever, received by user from any third party website. Accordingly, GENESIS DIAMONDS does not make any representations concerning the privacy practices or policies of such third parties or terms of use of such third party websites, nor does GENESIS DIAMONDS control or guarantee the accuracy, integrity, or quality of the information, data, text, software, music, sound, photographs, graphics, videos, messages or other materials available on such"
                  " third party websites. The inclusion or exclusion does not imply any endorsement by GENESIS DIAMONDS of the third party websites, the website's provider, or the information on the website. The information provided by user to such third party websites shall be governed in accordance with the privacy policies of such third party websites and it is recommended that user reviews the privacy policy of such third party websites prior to using such websites. Security and Retention The security of user’s Personal Information is important to GENESIS DIAMONDS. GENESIS DIAMONDS strives to ensure the security of user’s Personal Information and to protect user’s Personal Information against unauthorized access or unauthorized alteration, disclosure or destruction. For this purpose, GENESIS DIAMONDS adopts internal reviews of the data collection, storage and processing practices and security measures, including appropriate encryption and physical security measures to guard against unauthorized access to systems where GENESIS DIAMONDS stores user’s Personal Information. Each of the GENESIS DIAMONDS’s entities shall adopt"
                  " reasonable security practices and procedures as mandated under applicable laws for the protection of user Information. Provided that user rights to claim damages shall be limited to the right to claim only statutory damages under Information Technology Act, 2000 and user hereby waives and releases all GENESIS DIAMONDS’s entities from any claim of damages under contract or under tort. If user chooses a payment gateway to complete any transaction on Website, then user’s credit / debit card data may be stored in compliance with industry standards / recommended data security standard for security of financial information such as the Payment Card Industry Data Security Standard (PCI-DSS). GENESIS DIAMONDS may share user’s Information with third parties under a confidentiality agreement which inter alia provides for that such third parties not disclosing the Information further unless such disclosure is for the Purpose. However, GENESIS DIAMONDS is not responsible for any breach of security or for any actions of any third parties that receive user’s Personal Information. GENESIS DIAMONDS is not liable for any loss or injury caused to user as a result of user providing his / her Personal Information to third party (including any third party websites, even if links to such third party websites are provided on the Website). Notwithstanding anything contained in this Policy or elsewhere, Genesis Diamonds shall not be held responsible for any loss, damage or misuse of user’s Personal Information, if such loss, damage or misuse is attributable to a Force Majeure Event (as defined below). A Force Majeure Event shall mean any event that is beyond the reasonable control of Genesis Diamonds and shall include, without limitation, sabotage, fire, flood, explosion, acts of God, civil commotion, strikes or industrial action of any kind, riots, insurrection, war, acts of government, computer hacking, unauthorised access to computer, computer system or computer network,, computer crashes, breach of security and encryption (provided beyond reasonable control of GENESIS DIAMONDS), power or electricity failure or unavailability of adequate power or electricity. While GENESIS DIAMONDS will endeavour to take all reasonable and appropriate steps to keep secure any Personal Information which GENESIS DIAMONDS holds about user and prevent "
                  "unauthorized access, user acknowledges that the internet or computer "
                  "networks are not fully secure and that GENESIS DIAMONDS cannot provide any absolute assurance regarding the security of user’s Personal Information. User agrees that all Personal Information shall be retained till such time required for the Purpose or required under applicable law, whichever is later. Non-Personal Information will be retained indefinitely. User discretion and opt"
                  " out User agrees and acknowledges that he / she is providing his / her Information out of their free will. User has an option not to provide or permit GENESIS DIAMONDS to collect his / her Personal Information or later on withdraw his / her consent with respect to such Personal Information so provided herein by sending an email to the grievance officer or such other electronic address of the respective Genesis Diamondsentity as may be notified to user. In such case, user should neither visit any Website nor use any services provided by GENESIS DIAMONDS’s entities nor shall contact any of GENESIS DIAMONDS’s entities. Further, GENESIS DIAMONDS may not deliver products to user, upon user’s order or GENESIS DIAMONDS may deny user access from using certain services offered on the Website. User can add or update his / her Personal Information on regular basis. Kindly note that GENESIS DIAMONDS would retain user’s previous Personal Information in its records. Use of Cookies Cookies are strings of text that a website transmits to a user's computer. Cookies enable a website to keep track of a user's preferences and activities relating to that website. "
                  "Our website creates a temporary cookie for each visit to facilitate the visit."
              " These cookies automatically expire as soon as you leave our website. If you do not wish to receive these cookies, you may set your browser to reject the cookies, although doing so may affect your ability to perform certain transactions on our website. The main purpose of using these cookies is to improve your experience. For example, our cookies allow you to login without repeatedly typing the registered email address or registration number and password. We also use them to deliver information and fresh content specific to your interests. Cookies are widely used on most major sites. Cookies can also be used to track a user's browsing or online purchasing habits, and to target advertisements to specific users. We may use third party advertising companies to serve ads on our behalf. These companies may employ cookies and action tags to measure advertising effectiveness."
                " Any information that these third parties collect via cookies and action"
                  " tags is completely anonymous. Grievance Officer The name and contact details of the Grievance Officer, appointed in terms of the information technology laws, are provided below: Name: XXXXXXXEmail: XXXXBusiness / Assets Sale or Transfers Genesis Diamonds may sell, transfer or otherwise share some or all of its assets, including user Information in connection with a merger, acquisition, reorganization or sale of assets or business or in the event of bankruptcy. Should such a sale or transfer occur,"
                  " such GENESIS DIAMONDS entity will reasonably ensure that the Information user has provided and which GENESIS DIAMONDS has collected is stored and used by the transferee in a manner that is consistent with this Privacy Policy. Any third party to which any of GENESIS DIAMONDS’s entity transfers or sells as aforesaid will have the right to continue to use the Information that user has provided to GENESIS DIAMONDS or collected by GENESIS DIAMONDS immediately prior to such transfer or sale. The User Information is being collected by the Company with its address at registered GROUND FLOOR , CC 27/408, 9TH CROSS ROAD, PANAMPILLY NAGAR, ERNAKULAM, Kerala, 682036 and the Company will delete any User Information upon the User withdrawing the consent in writing. However, upon the withdrawal of the consent by the User, the Company may at its option not provide any services for which the Information was sought, and the User shall not claim deficiency of services on the basis of such non provision of goods and services. GENESIS DIAMONDS reserves the right to amend this policy from time to time, at its own discretion. Any updates will be posted on the application / and user’s use of Genesis Diamonds after such amendment shall constitute user’s agreement to abide by the amended terms. THIS PRIVACY POLICY IS AN ELECTRONIC RECORD IN THE FORM OF AN ELECTRONIC CONTRACT FORMED UNDER THE INFORMATION TECHNOLOGY ACT, 2000 AND THE RULES MADE THEREUNDER AND THE AMENDED PROVISIONS PERTAINING TO ELECTRONIC DOCUMENTS / RECORDS IN VARIOUS STATUTES AS AMENDED BY THE INFORMATION TECHNOLOGY ACT, 2000. THIS PRIVACY POLICY DOES NOT REQUIRE ANY PHYSICAL, ELECTRONIC OR DIGITAL SIGNATURE. THIS PRIVACY POLICY IS A LEGALLY BINDING DOCUMENT BETWEEN USER AND GENESIS DIAMONDS(BOTH TERMS DEFINED BELOW). THE TERMS OF THIS PRIVACY POLICY WILL BE EFFECTIVE UPON USER’S ACCEPTANCE OF THE SAME (DIRECTLY OR INDIRECTLY IN ELECTRONIC FORM, BY CLICKING ON THE I ACCEPT TAB OR BY USE OF THE WEBSITE OR BY OTHER MEANS) AND WILL GOVERN THE RELATIONSHIP BETWEEN USER AND GENESIS DIAMONDSFOR USER’S USE OF THE WEBSITE (DEFINED BELOW). THIS DOCUMENT IS PUBLISHED AND SHALL BE CONSTRUED IN ACCORDANCE WITH THE PROVISIONS OF THE INFORMATION TECHNOLOGY (REASONABLE SECURITY PRACTICES AND PROCEDURES AND SENSITIVE PERSONAL DATA OF INFORMATION) RULES, 2011 UNDER INFORMATION TECHNOLOGY ACT, 2000; THAT REQUIRE PUBLISHING OF THE PRIVACY POLICY FOR COLLECTION, USE, STORAGE AND TRANSFER OF SENSITIVE PERSONAL DATA OR INFORMATION. PLEASE READ THIS PRIVACY POLICY CAREFULLY. BY USING THE WEBSITE, USER INDICATES THAT HE / SHE UNDERSTANDS, AGREES AND CONSENTS TO THIS PRIVACY POLICY. IF USER DOES NOT AGREE WITH THE TERMS OF THIS PRIVACY POLICY, HE / SHE IS REQUESTED TO NOT USE THIS WEBSITE. USER HEREBY PROVIDES HIS / HER UNCONDITIONAL CONSENT TO GENESIS DIAMONDSAS PROVIDED UNDER SECTION 43A AND SECTION 72A OF INFORMATION TECHNOLOGY ACT, 2000."

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Scheme Details",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Poppins")),
            ),
            Container(
              height:MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/Scheme5.png"),
                      fit: BoxFit.fill,
                    )
                )
            ),
            Container(
                height:MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/Scheme4.png"),
                      fit: BoxFit.fill,
                    )
                )
            ),
            // Container(
            //     height:MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: new BoxDecoration(
            //         image: new DecorationImage(
            //           image: new AssetImage("assets/images/Scheme3.png"),
            //           fit: BoxFit.fill,
            //         )
            //     )
            // ),
            Container(
                height:MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/Scheme2.png"),
                      fit: BoxFit.fill,
                    )
                )
            ),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: InteractiveViewer(
                panEnabled: false,
                boundaryMargin: EdgeInsets.all(0),
                minScale: 0.5,
                maxScale: 5.0,
                child: GestureDetector(
                  onTap: () {
                    // Handle image click action here
                  },
                  child: Image.asset("assets/images/Scheme1.png",fit: BoxFit.fill,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
