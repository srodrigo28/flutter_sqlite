import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqLite{
    // Future<Database> openConnection() async{
    Future<void> openConnection() async{
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    await openDatabase(
        databaseFinalPath,
        version: 2,
        onCreate: (Database db, int version){
            final batch = db.batch();
            print('onCreate Chamado');
            batch.execute('''
                create table test(
                    id Integer primary key autoincrement,
                    nome varchar(100)
                )
            ''');
        },
        onUpgrade: (Database db, int oldVersion, int version){
            print('onUpgrade Chamado');
        },
        onDowngrade: (Database db, int oldVersion, int version){
            print('onUpgrade Chamado');
        },
    );
  }
}