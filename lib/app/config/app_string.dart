

import '../../data/models/video.dart';

class AppStrings{
  static const userBio = 'Frequent traveler and foodie looking for the best of what each city has to offer. Love exploring new cuisines and atmospheres from coast to coast and abroad!';
  static const socialLink = 'https://www.linkedin.com/in/hamzakhantareen/';
  static const MAPBOX_ACCESS_TOKEN = 'sk.eyJ1IjoiaGFtemFraGFuNjU0MyIsImEiOiJjbDYzN2JmYXAwNGR4M2pxcmQ2bWdoZTNzIn0.kGFtNQMG4Pxa_frjilxWvQ';

static  List<Video> videoList = [
  Video(thumbnail: 'assets/video-1.png', likes: 6.2),
  Video(thumbnail: 'assets/video-2.png', likes: 8.2),
  Video(thumbnail: 'assets/video-1.png', likes: 10.5),

];
  static  List<Video> favouriteList = [
    Video(thumbnail: 'assets/video-1.png', likes: 6.2),
    Video(thumbnail: 'assets/video-2.png', likes: 8.2),
    Video(thumbnail: 'assets/video-1.png', likes: 10.5),
  ];
  static  List<Video> playList = [
    Video(thumbnail: 'assets/playlist-1.png', likes: 6.2),
    Video(thumbnail: 'assets/playlist-2.png', likes: 8.2),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
    Video(thumbnail: 'assets/playlist-1.png', likes: 10.5),
  ];

}