---
name: to-chuc-html
description: Tổ chức, gom nhóm và chuẩn hóa các file HTML vào thư mục web/ theo cấu trúc phân loại rõ ràng (theo tác giả, nhân vật, video/truyện) và cập nhật đường dẫn liên kết tương đối. Luôn lập kế hoạch dự định trước, hỏi xác nhận và chỉ thực thi khi người dùng gõ dấu chấm (.).
---

# Skill: Tổ Chức HTML Trong Thư Mục Web (`to-chuc-html`)

Skill này dùng để thu thập, tổ chức và chuẩn hóa tất cả các trang web (`.html`) rải rác trong dự án vào một thư mục `web/` tập trung, phân cấp khoa học và bảo toàn liên kết tài nguyên.

---

## 1. Mục Tiêu & Cấu Trúc Đích Thư Mục `web/`

Khi chạy skill, cấu trúc thư mục `web/` được đề xuất như sau:

```text
web/
├── index.html                   # Cổng điều hướng chính cho toàn bộ trang web
├── assets/                      # CSS, JS, Fonts dùng chung (nếu có)
│   ├── css/
│   └── js/
├── lam/                         # Các trang web thuộc chuyên mục Lam
│   ├── index.html
│   ├── co-giao-ket-bung-bau-vao-ghe.html
│   ├── co-ket-bung-bau-vao-thanh-giuong-y-te.html
│   └── videos/
│       ├── video-chiec-bung-bau-ky-luc-150cm.html
│       ├── video-co-giao-bau-danh-roi-phan.html
│       └── video-toi-va-di-di-de.html
└── nhan/                        # Các trang web thuộc chuyên mục Nhân
    ├── index.html
    ├── naruto-bi-thuat-nghin-nam-dau-don.html
    ├── xem-truyen-shin.html
    ├── xem-truyen-ninh-cong-hoang.html
    ├── videos/
    │   ├── xem-video-doraemon.html
    │   ├── xem-video-kiteretsu.html
    │   ├── xem-video-naruto.html
    │   └── xem-video-shin.html
    └── oliver-tree/
        ├── xem-truyen-cash-machine.html
        ├── xem-video-oliver-alien-boy.html
        └── ...
```

---

## 2. Quy Tắc Chuẩn Hóa File HTML

1. **Chuẩn hóa tên file**:
   - Sử dụng định dạng `kebab-case` (chữ thường, không dấu, nối bằng dấu gạch ngang `-`) hoặc `snake_case`.
   - Loại bỏ các ký tự đặc biệt, dấu tiếng Việt để tương thích tốt nhất với mọi web server và trình duyệt.
2. **Cập nhật đường dẫn tương đối (Relative Path Preserving)**:
   - Khi di chuyển file `.html` vào thư mục sâu hơn trong `web/`, các đường dẫn liên kết đến ảnh (`images/`), video (`.mp4`), css, hoặc liên kết `<a href="...">` phải được tự động điều chỉnh tương ứng (ví dụ: chuyển `images/shin_1.jpg` thành `../../Truyện cười của Nhân/images/shin_1.jpg` hoặc đường dẫn assets chuẩn).
   - Đảm bảo không làm gãy (broken) bất kỳ ảnh hay video nào.

---

## 3. Quy Trình Thực Hiện Nghiêm Ngặt (2 Bước)

Khi người dùng kích hoạt skill này (bằng lệnh `/to-chuc-html` hoặc yêu cầu tổ chức file html):

### BƯỚC 1: Lập kế hoạch & Hỏi xác nhận (BẮT BUỘC DỪNG LẠI)
1. Quét toàn bộ các file `.html` hiện có trong toàn bộ dự án.
2. Phân tích nội dung và quan hệ giữa các file HTML để xếp vào đúng nhóm thư mục con trong `web/`.
3. Trình bày bảng **Dự định sẽ làm** chi tiết:

| STT | File HTML hiện tại | Vị trí dự kiến trong `web/` | Ghi chú điều chỉnh đường dẫn (Assets/Links) |
| :---: | :--- | :--- | :--- |
| 1 | `Lam/co_giao_ket_bung_bau_vao_ghe.html` | `web/lam/co-giao-ket-bung-bau-vao-ghe.html` | Cập nhật lại đường dẫn hình ảnh / video |
| 2 | `Truyện cười của Nhân/xem_truyen_shin.html` | `web/nhan/xem-truyen-shin.html` | Cập nhật lại link ảnh panel truyện |
| ... | ... | ... | ... |

4. Xuất câu hỏi xác nhận gửi đến người dùng:
   > **"Tôi đã lên dự định tổ chức lại toàn bộ file HTML vào thư mục `web/` như bảng trên. Bạn có xác nhận thực hiện không? Chỉ cần bạn gõ dấu chấm `.` là tôi sẽ thực thi theo dự định đó."**
5. **DỪNG LẠI HOÀN TOÀN TẠI ĐÂY.** Không di chuyển file, không tạo thư mục ở bước này! Chờ phản hồi của người dùng.

---

### BƯỚC 2: Thực thi khi người dùng gõ `.` (Dấu Chấm)
1. Khi nhận được tin nhắn từ người dùng chỉ chứa ký tự `.` (hoặc xác nhận đồng ý thực hiện):
2. Tạo cấu trúc các thư mục cần thiết trong `web/`.
3. Di chuyển/sao chép các file `.html` vào đúng vị trí đích.
4. Đọc và cập nhật lại các thẻ `<img src="...">`, `<video src="...">`, `<a href="...">`, `<link href="...">` trong từng file HTML để đường dẫn tương đối luôn chính xác.
5. In báo cáo tổng kết cấu trúc cây thư mục `web/` vừa hoàn thành.
