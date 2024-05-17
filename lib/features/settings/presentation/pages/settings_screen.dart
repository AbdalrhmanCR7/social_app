import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 190.0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    height: 140.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          4.0,
                        ),
                        topRight: Radius.circular(
                          4.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.newphotodownload.info/wp-content/uploads/2019/03/%D8%AE%D9%84%D9%81%D9%8A%D8%A7%D8%AA-%D8%AC%D8%A7%D9%84%D9%83%D8%B3%D9%8A-11-2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 64.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      'https://www.newphotodownload.info/wp-content/uploads/2019/03/%D8%AE%D9%84%D9%81%D9%8A%D8%A7%D8%AA-%D8%AC%D8%A7%D9%84%D9%83%D8%B3%D9%8A-11-2.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 5.0,
          ),
          const Text(
              'Abdalrhamn',
          ),
      const SizedBox(
        height: 5.0,),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '100',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Posts',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '265',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Photos',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '10k',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Followers',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '64',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Followings',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Photos',
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.edit,
                  size: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
