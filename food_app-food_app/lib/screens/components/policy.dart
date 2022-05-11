import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class policy extends StatefulWidget {
  const policy({Key? key}) : super(key: key);

  @override
  State<policy> createState() => _policyState();
}

class _policyState extends State<policy> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: iconColor,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          bottom: TabBar(
              unselectedLabelColor: Colors.redAccent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.redAccent, Colors.orangeAccent]),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              labelColor: Colors.black54,
              isScrollable: true,
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Privacy Policy"),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Terms & Conditions"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: SizedBox(
                      child: ListView(
                        children: const [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n\nLast updated: April 05, 2022 \n\n\n            This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You. \n We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.",
                            //overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nInterpretation and Definitions",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\nInterpretation",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "        The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nDefinations",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n       For the purposes of this Privacy Policy:\n\n 1. Account means a unique account created for You to access our Service or parts of our Service.\n\n2. Affiliate means an entity that controls, is controlled by or is under common control with a party, where 'control' means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority. \n\n 3. Application means the software program provided by the Company downloaded by You on any electronic device, named Eateries\n\n 4. Company (referred to as either 'the Company', 'We', 'Us' or 'Our' in this Agreement) refers to Eateries.\n\n 5. Country refers to: Nepal\n\n 6. Device means any device that can access the Service such as a computer, a cellphone or a digital tablet. \n\n 7. Personal Data is any information that relates to an identified or identifiable individual. \n\n 8. Service refers to the Application.\n\n 9. Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\n\n 10. Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit). \n\n 11. You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\n\nCollecting and Using Your Personal Data",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\nTypes of Data Collected",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\nPersonal Data",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n         While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n\n 1. Email address\n 2. First name and last name\n3. Usage Data",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nUsage DataUsage Data",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n       The Company may use Personal Data for the following purposes:\n\n 1.To provide and maintain our Service, including to monitor the usage of our Service.\n\n2. To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user. \n\n3. For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.\n\n 4.To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n\n 5. To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.\n\n 6.To manage Your requests: To attend and manage Your requests to Us. \n\n 7. For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred. \n\n 8.For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.\n\n     We may share Your personal information in the following situations: \n\n1. With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.\n\n 2.For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company. \n\n 3.With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us. \n\n 4.With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions. \n\n 5.With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.\n\n 6.With Your consent: We may disclose Your personal information for any other purpose with Your consent.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nRetention of Your Personal Data\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "       The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n\n         The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\n\nDisclosure of Your Personal Data",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nBusiness Transactions\n",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "       If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nLaw enforcement\n",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "       Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency). ",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nSecurity of Your Personal Data\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "       The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nChildren's Privacy\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "         Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers. \n\n        If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nChanges to this Privacy Policy\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "           We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page. \n\n        We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the 'Last updated' date at the top of this Privacy Policy. \n\n        You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nContact Us\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "      If you have any questions about this Privacy Policy, You can contact us:\n ",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "By email: eaterieshub@gmail.com",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //-------------TERMS AND CONDITIONS----------------
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: SizedBox(
                      child: ListView(
                        children: const [
                          Spacer(flex: 4),
                          Text(
                            "\nTerms and Conditions",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\nWelcome to Eateries!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n       These terms and conditions outline the rules and regulations for the use of Eateries. \n\n        By using this app we assume you accept these terms and conditions. Do not continue to use Eateries if you do not agree to take all of the terms and conditions stated on this page. \n\n        The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: 'Client', 'You' and 'Your' refers to you, the person log on this website and compliant to the Company’s terms and conditions. 'The Company', 'Ourselves', 'We', 'Our' and 'Us', refers to our Company. 'Party', 'Parties', or 'Us', refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same. Our Terms and Conditions were created with the help of the App Terms and Conditions Generator from App-Privacy-Policy.com",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nLicense",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n       Unless otherwise stated, Eateries and/or its licensors own the intellectual property rights for all material on Eateries. All intellectual property rights are reserved. You may access this from Eateries for your own personal use subjected to restrictions set in these terms and conditions.\n\nYou must not:\n\n1. Republish material from Eateries\n\n2. Sell, rent or sub-license material from Eateries\n\n3. Reproduce, duplicate or copy material from Eateries\n\n 3. Redistribute content from Eateries\n\n 4.This Agreement shall begin on the date hereof.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nYour Privacy",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "   Please read Privacy Policy.",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(flex: 4),
                          Text(
                            "\nDisclaimer",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\n       To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our App and the use of this website. Nothing in this disclaimer will:\n\n a. limit or exclude our or your liability for death or personal injury; \n\n b. limit or exclude our or your liability for fraud or fraudulent misrepresentation;\n\n c. limit any of our or your liabilities in any way that is not permitted under applicable law; or \n\n d. exclude any of our or your liabilities that may not be excluded under applicable law.\n\n        The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\n\n         As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
