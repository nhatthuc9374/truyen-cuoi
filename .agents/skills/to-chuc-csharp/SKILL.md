---
name: to-chuc-csharp
description: Tổ chức, phân loại và chuẩn hóa các file mã nguồn C# (.cs) theo chuẩn cấu trúc dự án .NET (phân nhóm Models, Services, Controllers, Utilities, chuẩn tên PascalCase và đồng bộ namespace tương ứng). Luôn lập kế hoạch dự định trước, hỏi xác nhận và chỉ thực thi khi người dùng gõ dấu chấm (.).
---

# Skill: Tổ Chức C# Source File (`to-chuc-csharp`)

Skill này giúp cấu trúc và chuẩn hóa toàn bộ các file mã nguồn C# (`.cs`) trong dự án theo chuẩn kiến trúc phần mềm .NET của Microsoft (Clean Architecture / Standard N-Tier), đảm bảo tính module hóa, dễ bảo trì và mở rộng.

---

## 1. Cấu Trúc Dự Án C# Chuẩn (.NET Standard Layout)

Các file `.cs` được tổ chức theo phân tầng chức năng rõ ràng:

```text
src/
└── TruyenCuoi.Core/             # Hoặc tên Project chính
    ├── TruyenCuoi.Core.csproj   # File cấu hình project .NET
    ├── Models/                  # Chứa các thực thể dữ liệu, DTOs, Enums
    │   ├── Story.cs
    │   ├── VideoInfo.cs
    │   └── StoryCategory.cs
    ├── Services/                # Chứa nghiệp vụ xử lý logic chính
    │   ├── StoryService.cs
    │   └── MediaOrganizerService.cs
    ├── Interfaces/              # Chứa các hợp đồng giao diện (Contracts)
    │   ├── IStoryService.cs
    │   └── IMediaOrganizerService.cs
    ├── Common/                  # Các tiện ích (Utilities, Helpers, Constants)
    │   ├── StringExtensions.cs
    │   └── FileHelper.cs
    └── Program.cs               # Điểm khởi chạy ứng dụng (Console/API)
```

---

## 2. Quy Tắc Chuẩn Hóa Mã Nguồn C#

1. **Quy tắc đặt tên file & Class (PascalCase)**:
   - Tên file `.cs` phải viết theo định dạng **PascalCase** và phải khớp chính xác 100% với tên `class`, `interface`, hoặc `enum` chính bên trong file.
   - Interface luôn bắt đầu bằng chữ cái `I` (ví dụ: `IStoryService.cs`).
   - Tuyệt đối không dùng tên file viết thường hoặc có dấu cách / gạch nối.
2. **Đồng bộ Namespace với thư mục**:
   - Khi chuyển một file C# vào thư mục con (ví dụ: chuyển `Story.cs` vào `Models/`), khai báo `namespace` bên trong file phải được cập nhật tương ứng theo quy ước chuẩn của C#:
     ```csharp
     namespace TruyenCuoi.Core.Models;
     ```
3. **Quản lý file dư thừa / tạm thời**:
   - Loại bỏ hoặc đưa vào `.gitignore` các thư mục build tạm thời của C# như `bin/`, `obj/`, `.vs/`.

---

## 3. Quy Trình Thực Hiện Nghiêm Ngặt (2 Bước)

Khi người dùng kích hoạt skill này (bằng lệnh `/to-chuc-csharp` hoặc yêu cầu tổ chức code C#):

### BƯỚC 1: Lập kế hoạch & Hỏi xác nhận (BẮT BUỘC DỪNG LẠI)
1. Quét tìm tất cả các file `.cs` hiện có trong dự án.
   - *Trường hợp chưa có file C#*: Thông báo cho người dùng và đề xuất khởi tạo khung cấu trúc dự án mẫu C# .NET phục vụ quản lý kho truyện (kèm các class mẫu `Story.cs`, `StoryService.cs`).
   - *Trường hợp đã có file C#*: Phân tích class bên trong từng file để xác định nhóm thư mục thích hợp (`Models`, `Services`, `Common`...).
2. Lập bảng **Dự định sẽ làm** chi tiết:

| STT | File C# hiện tại | Thư mục & Tên mới dự kiến | Namespace mới tương ứng |
| :---: | :--- | :--- | :--- |
| 1 | `Story.cs` (nằm ở root) | `src/TruyenCuoi.Core/Models/Story.cs` | `TruyenCuoi.Core.Models` |
| 2 | `story_helper.cs` | `src/TruyenCuoi.Core/Common/StoryHelper.cs` | `TruyenCuoi.Core.Common` |
| ... | ... | ... | ... |

3. Xuất câu hỏi xác nhận gửi đến người dùng:
   > **"Tôi đã lên dự định tổ chức các file mã nguồn C# như bảng trên. Bạn có xác nhận thực hiện không? Chỉ cần bạn gõ dấu chấm `.` là tôi sẽ thực thi theo dự định đó."**
4. **DỪNG LẠI HOÀN TOÀN TẠI ĐÂY.** Không di chuyển file, không chỉnh sửa namespace ở bước này! Chờ phản hồi của người dùng.

---

### BƯỚC 2: Thực thi khi người dùng gõ `.` (Dấu Chấm)
1. Khi nhận được tin nhắn từ người dùng chỉ chứa ký tự `.` (hoặc xác nhận đồng ý thực hiện):
2. Tạo cấu trúc thư mục `src/...`.
3. Di chuyển/đổi tên file sang PascalCase chuẩn.
4. Cập nhật câu lệnh `namespace` trong từng file C# cho khớp với thư mục mới.
5. In kết quả tổng kết cấu trúc project C# đã được quy hoạch hoàn chỉnh.
