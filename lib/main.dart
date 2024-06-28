import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TourGuideApp());
}

class TourGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TripPlan(),
      child: MaterialApp(
        title: 'Туристический гид',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/city': (context) => CityScreen(),
          '/attraction': (context) => AttractionScreen(),
          '/tripPlanning': (context) => TripPlanningScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}

class TripPlan extends ChangeNotifier {
  final List<String> _plan = [];

  List<String> get plan => _plan;

  void addAttraction(String attraction) {
    _plan.add(attraction);
    notifyListeners();
  }

  void removeAttraction(String attraction) {
    _plan.remove(attraction);
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Туристический гид'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.pushNamed(context, '/tripPlanning');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Нью-Йорк'),
            onTap: () {
              Navigator.pushNamed(context, '/city', arguments: 'Нью-Йорк');
            },
          ),
          ListTile(
            title: Text('Париж'),
            onTap: () {
              Navigator.pushNamed(context, '/city', arguments: 'Париж');
            },
          ),
          ListTile(
            title: Text('Лондон'),
            onTap: () {
              Navigator.pushNamed(context, '/city', arguments: 'Лондон');
            },
          ),
          ListTile(
            title: Text('Токио'),
            onTap: () {
              Navigator.pushNamed(context, '/city', arguments: 'Токио');
            },
          ),
          ListTile(
            title: Text('Москва'),
            onTap: () {
              Navigator.pushNamed(context, '/city', arguments: 'Москва');
            },
          ),
        ],
      ),
    );
  }
}

class CityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Город'),
        ),
        body: Center(
          child: Text('Город не выбран.'),
        ),
      );
    }

    final String cityName = routeArgs as String;

    final Map<String, List<Map<String, String>>> attractions = {
      'Нью-Йорк': [
        {
          'name': 'Статуя Свободы',
          'imageUrl': 'https://avatars.dzeninfra.ru/get-zen_doc/3628719/pub_64cd527f2b27db031823a68e_64ce6401b01c1104ddd3e065/scale_1200',
          'description': 'Статуя Свободы - это колоссальная неоклассическая скульптура на острове Свободы в гавани Нью-Йорка.'
        },
        {
          'name': 'Центральный парк',
          'imageUrl': 'https://avatars.dzeninfra.ru/get-zen_doc/1906120/pub_62834ca8f4c69729fbb6884f_628400822e90797eff6e564c/scale_1200',
          'description': 'Центральный парк - это городской парк в центре Манхэттена в Нью-Йорке.'
        },
      ],
      'Париж': [
        {
          'name': 'Эйфелева башня',
          'imageUrl': 'https://images.unsplash.com/photo-1565881606991-789a8dff9dbb?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Эйфелева башня - это кованая железная решетчатая башня на Марсовом поле в Париже, Франция.'
        },
        {
          'name': 'Лувр',
          'imageUrl': 'https://images.unsplash.com/photo-1535399475061-ad1dca038c26?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Лувр - это крупнейший в мире художественный музей и исторический памятник в Париже, Франция.'
        },
      ],
      'Лондон': [
        {
          'name': 'Биг Бен',
          'imageUrl': 'https://plus.unsplash.com/premium_photo-1661922394754-5d8d05a448cf?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Биг Бен - это часовая башня, часть дворца Вестминстер в Лондоне.'
        },
        {
          'name': 'Букингемский дворец',
          'imageUrl': 'https://images.unsplash.com/photo-1661626831134-45922244d262?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Букингемский дворец - это лондонская резиденция и административная штаб-квартира монарха Соединенного Королевства.'
        },
      ],
      'Токио': [
        {
          'name': 'Токийская башня',
          'imageUrl': 'https://i.imgur.com/HLa9wnM.jpg',
          'description': 'Токийская башня - это телебашня в районе Сибако в Токио, Япония.'
        },
        {
          'name': 'Императорский дворец',
          'imageUrl': 'https://images.unsplash.com/photo-1669024595566-0d9efa64caa2?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Императорский дворец - это главная резиденция Императора Японии.'
        },
      ],
      'Москва': [
        {
          'name': 'Красная площадь',
          'imageUrl': 'https://images.unsplash.com/photo-1689902520239-47512e3b0a5d?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Красная площадь - это центральная площадь Москвы, Россия.'
        },
        {
          'name': 'Кремль',
          'imageUrl': 'https://plus.unsplash.com/premium_photo-1697729939290-40a6275148cd?q=80&w=1962&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'description': 'Московский Кремль - это крепость в центре Москвы, резиденция президента России.'
        },
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: ListView(
        children: attractions[cityName]!.map((attraction) {
          return ListTile(
            title: Text(attraction['name']!),
            onTap: () {
              Navigator.pushNamed(context, '/attraction', arguments: attraction);
            },
          );
        }).toList(),
      ),
    );
  }
}

class AttractionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Достопримечательность'),
        ),
        body: Center(
          child: Text('Достопримечательность не выбрана.'),
        ),
      );
    }

    final Map<String, String> attractionDetails = routeArgs as Map<String, String>;
    final String attractionName = attractionDetails['name']!;
    final String imageUrl = attractionDetails['imageUrl']!;
    final String description = attractionDetails['description']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(attractionName),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TripPlan>(context, listen: false).addAttraction(attractionName);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$attractionName добавлено в план поездки')),
              );
            },
            child: Text('Добавить в план поездки'),
          ),
        ],
      ),
    );
  }
}

class TripPlanningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tripPlan = Provider.of<TripPlan>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('План поездки'),
      ),
      body: ListView.builder(
        itemCount: tripPlan.plan.length,
        itemBuilder: (context, index) {
          final attraction = tripPlan.plan[index];
          return ListTile(
            title: Text(attraction),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<TripPlan>(context, listen: false).removeAttraction(attraction);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$attraction удалено из плана поездки')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Text('Информация о пользователе'),
      ),
    );
  }
}
