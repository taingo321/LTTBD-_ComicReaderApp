class Book {
  final double Date;
  final String TacGia;
  final int storyId;
  final double part;
  final double rating;
  final String category;
  final String storyName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Book(
      {
      required this.Date,
      required this.TacGia,
      required this.storyId,
      required this.category,
      required this.storyName,
      required this.rating,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.part,
      required this.isSelected});

  //List of Books data
  static List<Book> bookList = [
    Book(
        Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 0,
        category: 'THIẾU NHI',
        storyName: 'Conan',
        rating: 4.5,
        imageURL: 'assets/images/a4.jpg',
        isFavorated: true,
        decription:
            'Đây là một cuốn truyện nói về các vụ án mà CoNan là nhân vật chính phải đối mặt và tìm ra cách giải quyết.',
        part: 100,
        isSelected: false),
    Book(
        Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 1,
        category: 'THIẾU NHI',
        storyName: 'Doraemon',
        rating: 4.5,
        imageURL: 'assets/images/a12.jpg',
        isFavorated: false,
        decription:
            'Nói về cuộc phiêu lưu của chú mèo máy Doraemon và những người bạn đáng yêu.',
        part: 100,
        isSelected: false),
    Book(
        Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 2,
        category: 'THIẾU NHI',
        storyName: 'One Piece',
        rating: 4.8,
        imageURL: 'assets/images/a8.jpg',
        isFavorated: false,
        decription:
            'Cuộc thám hiểm của thuyền trưởng trẻ tuổi Luffy và các cộng sự của mình.Trên đường chinh phục đại hải trình.',
        part: 100,
        isSelected: false),
    Book(
         Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 3,
        category: 'THIẾU NHI',
        storyName: 'Trạng Quỷnh',
        rating: 4.8,
        imageURL: 'assets/images/a7.jpg',
        isFavorated: false,
        decription:
            'Trí thông minh,sự lanh lẹo của một cậu nhóc có tên là Trạng Quỷnh ,dùng để xử lí những tình huống hằng ngày.',
        part: 100,
        isSelected: false),
    Book(
         Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 4,
        category: 'THIẾU NHI',
        storyName: 'Trạng Quỷnh',
        rating: 4.8,
        imageURL: 'assets/images/a7.jpg',
        isFavorated: true,
        decription:
            'Trí thông minh,sự lanh lẹo của một cậu nhóc có tên là Trạng Quỷnh ,dùng để xử lí những tình huống hằng ngày.',
        part: 100,
        isSelected: false),
    Book(
        Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 5,
        category: 'THIẾU NHI',
        storyName: 'Cậu bé bút chì',
        rating: 4.8,
        imageURL: 'assets/images/a8.jpg',
        isFavorated: false,
        decription:
            'Trí thông minh,sự lanh lẹo của một cậu nhóc có tên là Trạng Quỷnh ,dùng để xử lí những tình huống hằng ngày.',
        part: 100,
        isSelected: false),
    Book(
        Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 6,
        category: 'THIẾU NHI',
        storyName: 'Thần đồng đất Việt',
        rating: 4.8,
        imageURL: 'assets/images/a9.jpg',
        isFavorated: false,
        decription:
            'Trí thông minh,sự lanh lẹo của một cậu nhóc có tên là Trạng Quỷnh ,dùng để xử lí những tình huống hằng ngày.',
        part: 100,
        isSelected: false),
    Book(
       Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 7,
        category: 'HÀNH ĐỘNG',
        storyName: 'Bảy viên ngọc rồng',
        rating: 4.8,
        imageURL: 'assets/images/a8.jpg',
        isFavorated: false,
        decription:
            'Trí thông minh,sự lanh lẹo của một cậu nhóc có tên là Trạng Quỷnh ,dùng để xử lí những tình huống hằng ngày.',
        part: 100,
        isSelected: false),
    Book( 
        Date: 20/2/2024,
        TacGia: 'Nguyen Van A',
        storyId: 8,
        category: 'HÀI HƯỚC',
        storyName: 'Ô long viện',
        rating: 4.8,
        imageURL: 'assets/images/a11.jpg',
        isFavorated: false,
        decription:
            'Trí thông minh,sự lanh lẹo của một cậu nhóc có tên là Trạng Quỷnh ,dùng để xử lí những tình huống hằng ngày.',
        part: 100,
        isSelected: false),
  ];

  get size => null;

  //Get the favorated items
  static List<Book> getFavoritedBooks() {
    List<Book> _travelList = Book.bookList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Book> addedToCartBooks() {
    List<Book> _selectedBooks = Book.bookList;
    return _selectedBooks
        .where((element) => element.isSelected == true)
        .toList();
  }
}
