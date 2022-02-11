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
        //Cria um banco caso não exista.
        onCreate: (Database db, int version){
            final batch = db.batch();
            print('onCreate Chamado');
            batch.execute('''
                create table test(
                    id Integer primary key autoincrement,
                    nome varchar(100)
                )
            ''');
            batch.commit();
        },
        // Será chamando sempre que ouver uma alteração na versão
        onUpgrade: (Database db, int oldVersion, int version){
            print('onUpgrade Chamado');
            final batch = db.batch();
            batch.execute('''
                create table produtos(
                    id Integer primary key autoincrement,
                    descricao varchar(100),
                    quantidade int,
                    valor real,
                    descricao text,
                )
            ''');
            batch.commit();
        },
        // volta sempre uma versão anterior da atual
        onDowngrade: (Database db, int oldVersion, int version){
            print('onUpgrade Chamado');
        },
    );
  }
}