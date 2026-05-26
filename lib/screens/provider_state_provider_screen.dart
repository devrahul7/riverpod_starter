import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


  final appBarProvider =  Provider<String>((ref) {
    return "Provider & StateProvider";
  });

  final appBarDescriptionProvider= Provider<String>((ref){
    return "Provider is the most basic provider. It exposes a read-only value that cannot be changed from outside. Use it for constants, computed values, or dependency injection";
  });

  final appBarDes2Provider = Provider<String>((ref){
    return 'StateProvider is a provider that exposes a simple mutable state. It is ideal for storing simple values like int, bool, String, or enum that can be modified from outside.';
  });

final counterProvider = StateProvider<int>((ref) {
  return 100;
  
});

class ProviderStateProviderScreen extends ConsumerWidget {
  const ProviderStateProviderScreen({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                     Text(
                      ref.read(appBarProvider),
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: Colors.white),
                    )
                 
                  ],
                ),
              ),
              Card(
                color: Colors.white.withValues(alpha: 0.15),
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer(builder: (context,ref,child){
                   return Text( ref.read(appBarDescriptionProvider),
                   
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  );
                  })
                ),
              ),
              Card(
                color: Colors.white.withValues(alpha: 0.15),
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  Text(
                      ref.read(appBarDes2Provider),
                    
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                 
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Counter',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        ref.watch(counterProvider).toString(),
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              ref.read(counterProvider.notifier).state--;

            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
              ref.read(counterProvider.notifier).state =0;
            },
            backgroundColor: Colors.grey,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
