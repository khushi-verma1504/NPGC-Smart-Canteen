import 'package:npgc_smart_canteen/services/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
class SocialLogin extends StatefulWidget{
  const SocialLogin({super.key});
  @override
  State<StatefulWidget> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin>{
  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);

    try {
      await AuthService().signInWithGoogle();
    } catch (e) {
      print(e);
    }

    setState(() => _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       SizedBox(height: 10,),
       Row(
         children: [
           const Expanded(
             child: Divider(
               thickness: 1,
             ),
           ),
           const SizedBox(width: 10),

           Text(
             "hungry? lets continue with these",
             style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14, color: Colors.grey),
           ),
           const SizedBox(width: 10),
           const Expanded(
             child: Divider(
               thickness: 1,
             ),
           ),
         ],
       ),
       SizedBox(
         height: 20,
       ),
    if (_isLoading) const CircularProgressIndicator(),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: IconButton(
      onPressed: _handleGoogleSignIn,
      icon: SvgPicture.asset(
      'assets/icons/Google.svg',
      height: 40,
      ),
      ),
    ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1
            ),
            borderRadius: BorderRadius.circular(50)
        ),
        child: IconButton(
          onPressed: (){},
          icon: SvgPicture.asset(
            'assets/icons/Apple.svg',
            height: 40,
          ),
        ),
      ),
     ],
    ),
    ]
   );
  }
}