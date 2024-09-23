import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EcoStilPage extends StatefulWidget {
  @override
  _EcoStilPageState createState() => _EcoStilPageState();
}

class _EcoStilPageState extends State<EcoStilPage> {
  final List<Map<String, String>> blogPosts = [
    {
      "title": "Doğa Dostu Moda: Geri Dönüşüm Fikirleri",
      "description": "Eski kıyafetlerinizi atmak yerine, onlardan yeni eşyalar yaparak modaya ayak uydurabilirsiniz. Bu yazıda, geri dönüştürülebilecek eşyalar için yaratıcı fikirler bulacaksınız.",
      "imageUrl": "https://st4.depositphotos.com/16626102/39687/v/1600/depositphotos_396876296-stock-illustration-recycle-symbol-recycling-clothes-sign.jpg",
      "link": "https://www.trendyol.com/butik/liste/1/kadin", // Link eklenmiş
    },
    {
      "title": "Sürdürülebilir Moda: Organik Kumaşlar",
      "description": "Organik pamuk ve bambu gibi doğa dostu kumaşlarla yapılmış kıyafetler giyerek çevreye duyarlı olabilirsiniz. Bu yazıda organik kumaşların faydalarını keşfedin. Dolabında kullanmadığın kıyafetleri bağışla veya yeniden değerlendir.",
      "imageUrl": "https://st4.depositphotos.com/8707842/25417/i/1600/depositphotos_254170746-stock-photo-natural-fabrics-organic-colors-flax.jpg",
      "link": "https://www.example.com", // Link eklenmiş
    },
    {
      "title": "El Yapımı Moda: Yaratıcılığınızı Konuşturun",
      "description": "Kendi ellerinizle yapabileceğiniz kıyafet ve aksesuar fikirleri ile dolabınızı kişiselleştirin. Eski düğmeler ve kumaşlardan el yapımı aksesuarlar tasarlayabilirsin. El yapımı moda, hem bütçe dostu hem de özgün!",
      "imageUrl": "https://i.ytimg.com/vi/-MzPfc1ctrg/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBF59FOfVtWYICJ-u7K8NH7oDp0ng",
      "link": "https://www.example.com", // Link eklenmiş
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eco Stil Blog',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple.shade100.withOpacity(0.7),
        elevation: 0,
      ),
      body: Container(
        color: Colors.purple.shade100.withOpacity(0.4),
        child: ListView.builder(
          itemCount: blogPosts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await openUrl(blogPosts[index]['link']!); // Linki açma işlemi
              },
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                      child: Image.network(
                        blogPosts[index]['imageUrl'] ?? '',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 60,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            blogPosts[index]['title'] ?? 'Başlık bulunamadı',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: Colors.purple.shade800,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            blogPosts[index]['description'] ?? 'Açıklama bulunamadı',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> openUrl(String link) async {
    final Uri uri = Uri.parse(link);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("Link açılamadı: $link");
    }
  }
}
