import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Counter [AlihanSDev]',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // Используем extendBodyBehindAppBar, чтобы фон заходил под AppBar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Счетчик',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Прозрачный AppBar
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Красивый градиентный фон
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primaryContainer,
              theme.colorScheme.secondaryContainer,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Карточка с основным контентом
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 48.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.touch_app_rounded,
                          size: 64,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Текущее значение',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Анимированный счетчик
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(scale: animation, child: child);
                          },
                          child: Text(
                            '$_counter',
                            key: ValueKey<int>(_counter),
                            style: theme.textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface,
                              fontSize: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Нажмите кнопку, чтобы увеличить',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        label: const Text(
          'УВЕЛИЧИТЬ',
          style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold),
        ),
        elevation: 6,
      ),
    );
  }
}