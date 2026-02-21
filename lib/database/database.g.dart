// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, BookData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorsMeta = const VerificationMeta(
    'authors',
  );
  @override
  late final GeneratedColumn<String> authors = GeneratedColumn<String>(
    'authors',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isbn10Meta = const VerificationMeta('isbn10');
  @override
  late final GeneratedColumn<String> isbn10 = GeneratedColumn<String>(
    'isbn10',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isbn13Meta = const VerificationMeta('isbn13');
  @override
  late final GeneratedColumn<String> isbn13 = GeneratedColumn<String>(
    'isbn13',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbnailUrlMeta = const VerificationMeta(
    'thumbnailUrl',
  );
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
    'thumbnail_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publisherMeta = const VerificationMeta(
    'publisher',
  );
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
    'publisher',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedDateMeta = const VerificationMeta(
    'publishedDate',
  );
  @override
  late final GeneratedColumn<String> publishedDate = GeneratedColumn<String>(
    'published_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('wantToRead'),
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _googleBooksIdMeta = const VerificationMeta(
    'googleBooksId',
  );
  @override
  late final GeneratedColumn<String> googleBooksId = GeneratedColumn<String>(
    'google_books_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    authors,
    isbn10,
    isbn13,
    thumbnailUrl,
    description,
    publisher,
    pageCount,
    publishedDate,
    status,
    dateAdded,
    rating,
    googleBooksId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('authors')) {
      context.handle(
        _authorsMeta,
        authors.isAcceptableOrUnknown(data['authors']!, _authorsMeta),
      );
    } else if (isInserting) {
      context.missing(_authorsMeta);
    }
    if (data.containsKey('isbn10')) {
      context.handle(
        _isbn10Meta,
        isbn10.isAcceptableOrUnknown(data['isbn10']!, _isbn10Meta),
      );
    }
    if (data.containsKey('isbn13')) {
      context.handle(
        _isbn13Meta,
        isbn13.isAcceptableOrUnknown(data['isbn13']!, _isbn13Meta),
      );
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
        _thumbnailUrlMeta,
        thumbnailUrl.isAcceptableOrUnknown(
          data['thumbnail_url']!,
          _thumbnailUrlMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('publisher')) {
      context.handle(
        _publisherMeta,
        publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta),
      );
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    }
    if (data.containsKey('published_date')) {
      context.handle(
        _publishedDateMeta,
        publishedDate.isAcceptableOrUnknown(
          data['published_date']!,
          _publishedDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('google_books_id')) {
      context.handle(
        _googleBooksIdMeta,
        googleBooksId.isAcceptableOrUnknown(
          data['google_books_id']!,
          _googleBooksIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      authors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}authors'],
      )!,
      isbn10: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}isbn10'],
      ),
      isbn13: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}isbn13'],
      ),
      thumbnailUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_url'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      publisher: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}publisher'],
      ),
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      ),
      publishedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}published_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      )!,
      googleBooksId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_books_id'],
      ),
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class BookData extends DataClass implements Insertable<BookData> {
  final int id;
  final String title;
  final String authors;
  final String? isbn10;
  final String? isbn13;
  final String? thumbnailUrl;
  final String? description;
  final String? publisher;
  final int? pageCount;
  final String? publishedDate;
  final String status;
  final DateTime dateAdded;
  final int rating;
  final String? googleBooksId;
  const BookData({
    required this.id,
    required this.title,
    required this.authors,
    this.isbn10,
    this.isbn13,
    this.thumbnailUrl,
    this.description,
    this.publisher,
    this.pageCount,
    this.publishedDate,
    required this.status,
    required this.dateAdded,
    required this.rating,
    this.googleBooksId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['authors'] = Variable<String>(authors);
    if (!nullToAbsent || isbn10 != null) {
      map['isbn10'] = Variable<String>(isbn10);
    }
    if (!nullToAbsent || isbn13 != null) {
      map['isbn13'] = Variable<String>(isbn13);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = Variable<int>(pageCount);
    }
    if (!nullToAbsent || publishedDate != null) {
      map['published_date'] = Variable<String>(publishedDate);
    }
    map['status'] = Variable<String>(status);
    map['date_added'] = Variable<DateTime>(dateAdded);
    map['rating'] = Variable<int>(rating);
    if (!nullToAbsent || googleBooksId != null) {
      map['google_books_id'] = Variable<String>(googleBooksId);
    }
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      authors: Value(authors),
      isbn10: isbn10 == null && nullToAbsent
          ? const Value.absent()
          : Value(isbn10),
      isbn13: isbn13 == null && nullToAbsent
          ? const Value.absent()
          : Value(isbn13),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      pageCount: pageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pageCount),
      publishedDate: publishedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedDate),
      status: Value(status),
      dateAdded: Value(dateAdded),
      rating: Value(rating),
      googleBooksId: googleBooksId == null && nullToAbsent
          ? const Value.absent()
          : Value(googleBooksId),
    );
  }

  factory BookData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      authors: serializer.fromJson<String>(json['authors']),
      isbn10: serializer.fromJson<String?>(json['isbn10']),
      isbn13: serializer.fromJson<String?>(json['isbn13']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      description: serializer.fromJson<String?>(json['description']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      pageCount: serializer.fromJson<int?>(json['pageCount']),
      publishedDate: serializer.fromJson<String?>(json['publishedDate']),
      status: serializer.fromJson<String>(json['status']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      rating: serializer.fromJson<int>(json['rating']),
      googleBooksId: serializer.fromJson<String?>(json['googleBooksId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'authors': serializer.toJson<String>(authors),
      'isbn10': serializer.toJson<String?>(isbn10),
      'isbn13': serializer.toJson<String?>(isbn13),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'description': serializer.toJson<String?>(description),
      'publisher': serializer.toJson<String?>(publisher),
      'pageCount': serializer.toJson<int?>(pageCount),
      'publishedDate': serializer.toJson<String?>(publishedDate),
      'status': serializer.toJson<String>(status),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'rating': serializer.toJson<int>(rating),
      'googleBooksId': serializer.toJson<String?>(googleBooksId),
    };
  }

  BookData copyWith({
    int? id,
    String? title,
    String? authors,
    Value<String?> isbn10 = const Value.absent(),
    Value<String?> isbn13 = const Value.absent(),
    Value<String?> thumbnailUrl = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> publisher = const Value.absent(),
    Value<int?> pageCount = const Value.absent(),
    Value<String?> publishedDate = const Value.absent(),
    String? status,
    DateTime? dateAdded,
    int? rating,
    Value<String?> googleBooksId = const Value.absent(),
  }) => BookData(
    id: id ?? this.id,
    title: title ?? this.title,
    authors: authors ?? this.authors,
    isbn10: isbn10.present ? isbn10.value : this.isbn10,
    isbn13: isbn13.present ? isbn13.value : this.isbn13,
    thumbnailUrl: thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
    description: description.present ? description.value : this.description,
    publisher: publisher.present ? publisher.value : this.publisher,
    pageCount: pageCount.present ? pageCount.value : this.pageCount,
    publishedDate: publishedDate.present
        ? publishedDate.value
        : this.publishedDate,
    status: status ?? this.status,
    dateAdded: dateAdded ?? this.dateAdded,
    rating: rating ?? this.rating,
    googleBooksId: googleBooksId.present
        ? googleBooksId.value
        : this.googleBooksId,
  );
  BookData copyWithCompanion(BooksCompanion data) {
    return BookData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      authors: data.authors.present ? data.authors.value : this.authors,
      isbn10: data.isbn10.present ? data.isbn10.value : this.isbn10,
      isbn13: data.isbn13.present ? data.isbn13.value : this.isbn13,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
      description: data.description.present
          ? data.description.value
          : this.description,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      publishedDate: data.publishedDate.present
          ? data.publishedDate.value
          : this.publishedDate,
      status: data.status.present ? data.status.value : this.status,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      rating: data.rating.present ? data.rating.value : this.rating,
      googleBooksId: data.googleBooksId.present
          ? data.googleBooksId.value
          : this.googleBooksId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('authors: $authors, ')
          ..write('isbn10: $isbn10, ')
          ..write('isbn13: $isbn13, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('description: $description, ')
          ..write('publisher: $publisher, ')
          ..write('pageCount: $pageCount, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('status: $status, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('rating: $rating, ')
          ..write('googleBooksId: $googleBooksId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    authors,
    isbn10,
    isbn13,
    thumbnailUrl,
    description,
    publisher,
    pageCount,
    publishedDate,
    status,
    dateAdded,
    rating,
    googleBooksId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookData &&
          other.id == this.id &&
          other.title == this.title &&
          other.authors == this.authors &&
          other.isbn10 == this.isbn10 &&
          other.isbn13 == this.isbn13 &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.description == this.description &&
          other.publisher == this.publisher &&
          other.pageCount == this.pageCount &&
          other.publishedDate == this.publishedDate &&
          other.status == this.status &&
          other.dateAdded == this.dateAdded &&
          other.rating == this.rating &&
          other.googleBooksId == this.googleBooksId);
}

class BooksCompanion extends UpdateCompanion<BookData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> authors;
  final Value<String?> isbn10;
  final Value<String?> isbn13;
  final Value<String?> thumbnailUrl;
  final Value<String?> description;
  final Value<String?> publisher;
  final Value<int?> pageCount;
  final Value<String?> publishedDate;
  final Value<String> status;
  final Value<DateTime> dateAdded;
  final Value<int> rating;
  final Value<String?> googleBooksId;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.authors = const Value.absent(),
    this.isbn10 = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.publisher = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.status = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.rating = const Value.absent(),
    this.googleBooksId = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String authors,
    this.isbn10 = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.publisher = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime dateAdded,
    this.rating = const Value.absent(),
    this.googleBooksId = const Value.absent(),
  }) : title = Value(title),
       authors = Value(authors),
       dateAdded = Value(dateAdded);
  static Insertable<BookData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? authors,
    Expression<String>? isbn10,
    Expression<String>? isbn13,
    Expression<String>? thumbnailUrl,
    Expression<String>? description,
    Expression<String>? publisher,
    Expression<int>? pageCount,
    Expression<String>? publishedDate,
    Expression<String>? status,
    Expression<DateTime>? dateAdded,
    Expression<int>? rating,
    Expression<String>? googleBooksId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (authors != null) 'authors': authors,
      if (isbn10 != null) 'isbn10': isbn10,
      if (isbn13 != null) 'isbn13': isbn13,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (description != null) 'description': description,
      if (publisher != null) 'publisher': publisher,
      if (pageCount != null) 'page_count': pageCount,
      if (publishedDate != null) 'published_date': publishedDate,
      if (status != null) 'status': status,
      if (dateAdded != null) 'date_added': dateAdded,
      if (rating != null) 'rating': rating,
      if (googleBooksId != null) 'google_books_id': googleBooksId,
    });
  }

  BooksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? authors,
    Value<String?>? isbn10,
    Value<String?>? isbn13,
    Value<String?>? thumbnailUrl,
    Value<String?>? description,
    Value<String?>? publisher,
    Value<int?>? pageCount,
    Value<String?>? publishedDate,
    Value<String>? status,
    Value<DateTime>? dateAdded,
    Value<int>? rating,
    Value<String?>? googleBooksId,
  }) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      pageCount: pageCount ?? this.pageCount,
      publishedDate: publishedDate ?? this.publishedDate,
      status: status ?? this.status,
      dateAdded: dateAdded ?? this.dateAdded,
      rating: rating ?? this.rating,
      googleBooksId: googleBooksId ?? this.googleBooksId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
    }
    if (isbn10.present) {
      map['isbn10'] = Variable<String>(isbn10.value);
    }
    if (isbn13.present) {
      map['isbn13'] = Variable<String>(isbn13.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<String>(publishedDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (googleBooksId.present) {
      map['google_books_id'] = Variable<String>(googleBooksId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('authors: $authors, ')
          ..write('isbn10: $isbn10, ')
          ..write('isbn13: $isbn13, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('description: $description, ')
          ..write('publisher: $publisher, ')
          ..write('pageCount: $pageCount, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('status: $status, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('rating: $rating, ')
          ..write('googleBooksId: $googleBooksId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books];
}

typedef $$BooksTableCreateCompanionBuilder =
    BooksCompanion Function({
      Value<int> id,
      required String title,
      required String authors,
      Value<String?> isbn10,
      Value<String?> isbn13,
      Value<String?> thumbnailUrl,
      Value<String?> description,
      Value<String?> publisher,
      Value<int?> pageCount,
      Value<String?> publishedDate,
      Value<String> status,
      required DateTime dateAdded,
      Value<int> rating,
      Value<String?> googleBooksId,
    });
typedef $$BooksTableUpdateCompanionBuilder =
    BooksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> authors,
      Value<String?> isbn10,
      Value<String?> isbn13,
      Value<String?> thumbnailUrl,
      Value<String?> description,
      Value<String?> publisher,
      Value<int?> pageCount,
      Value<String?> publishedDate,
      Value<String> status,
      Value<DateTime> dateAdded,
      Value<int> rating,
      Value<String?> googleBooksId,
    });

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authors => $composableBuilder(
    column: $table.authors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn10 => $composableBuilder(
    column: $table.isbn10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get googleBooksId => $composableBuilder(
    column: $table.googleBooksId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authors => $composableBuilder(
    column: $table.authors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn10 => $composableBuilder(
    column: $table.isbn10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get googleBooksId => $composableBuilder(
    column: $table.googleBooksId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get authors =>
      $composableBuilder(column: $table.authors, builder: (column) => column);

  GeneratedColumn<String> get isbn10 =>
      $composableBuilder(column: $table.isbn10, builder: (column) => column);

  GeneratedColumn<String> get isbn13 =>
      $composableBuilder(column: $table.isbn13, builder: (column) => column);

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get googleBooksId => $composableBuilder(
    column: $table.googleBooksId,
    builder: (column) => column,
  );
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BooksTable,
          BookData,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (BookData, BaseReferences<_$AppDatabase, $BooksTable, BookData>),
          BookData,
          PrefetchHooks Function()
        > {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> authors = const Value.absent(),
                Value<String?> isbn10 = const Value.absent(),
                Value<String?> isbn13 = const Value.absent(),
                Value<String?> thumbnailUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<String?> publishedDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<String?> googleBooksId = const Value.absent(),
              }) => BooksCompanion(
                id: id,
                title: title,
                authors: authors,
                isbn10: isbn10,
                isbn13: isbn13,
                thumbnailUrl: thumbnailUrl,
                description: description,
                publisher: publisher,
                pageCount: pageCount,
                publishedDate: publishedDate,
                status: status,
                dateAdded: dateAdded,
                rating: rating,
                googleBooksId: googleBooksId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String authors,
                Value<String?> isbn10 = const Value.absent(),
                Value<String?> isbn13 = const Value.absent(),
                Value<String?> thumbnailUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<String?> publishedDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                required DateTime dateAdded,
                Value<int> rating = const Value.absent(),
                Value<String?> googleBooksId = const Value.absent(),
              }) => BooksCompanion.insert(
                id: id,
                title: title,
                authors: authors,
                isbn10: isbn10,
                isbn13: isbn13,
                thumbnailUrl: thumbnailUrl,
                description: description,
                publisher: publisher,
                pageCount: pageCount,
                publishedDate: publishedDate,
                status: status,
                dateAdded: dateAdded,
                rating: rating,
                googleBooksId: googleBooksId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BooksTable,
      BookData,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (BookData, BaseReferences<_$AppDatabase, $BooksTable, BookData>),
      BookData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
}
