---
name: dat-ten-truyen
description: Đặt tên và chuẩn hóa tên các file truyện cười (.md) theo định dạng [Emoji] [Tên Tiếng Việt Có Dấu Viết Hoa Từng Từ]. Tự động quét toàn bộ file markdown trong dự án nếu không chỉ định file. Luôn lập kế hoạch dự định trước, hỏi xác nhận và chỉ thực thi khi người dùng gõ dấu chấm (.).
---

# Skill: Đặt Tên Truyện Cười (`dat-ten-truyen`)

Skill này dùng để chuẩn hóa và đặt tên cho các file truyện cười định dạng Markdown (`.md`) trong dự án theo đúng quy chuẩn thống nhất, thân thiện và giàu cảm xúc.

---

## 1. Quy Tắc Đặt Tên File

Mỗi file truyện cười `.md` phải tuân thủ nghiêm ngặt định dạng sau:

```text
[Emoji] [Tên Tiếng Việt Có Dấu Viết Hoa Ký Tự Đầu Tiên Của Mỗi Từ].md
```

### Chi tiết các thành phần:
1. **Emoji đầu file**:
   - Bắt buộc có **1 Emoji** đại diện phù hợp nhất với nội dung, nhân vật hoặc bối cảnh câu chuyện.
   - Ngay sau Emoji là 1 dấu cách (khoảng trắng ` `).
   - *Gợi ý Emoji*:
     - 🍃 hoặc 🤰: Truyện mang bầu, sinh nở, gia đình của Lam.
     - 👩‍🏫 hoặc 🏫: Truyện cô giáo, trường lớp, lớp học.
     - 🥷: Truyện Naruto, Ninja.
     - 🖍️: Truyện Shin - Cậu bé bút chì.
     - 🤖 hoặc 👓: Doraemon, Kiteretsu, công nghệ, sáng chế.
     - 🎤 hoặc 🎭: Oliver Tree, kịch nghệ, ca sĩ, hài hước.
     - 🏥: Khám thai, bệnh viện, bác sĩ, đi đẻ.
     - 🤣 hoặc 😂: Truyện cười châm biếm, tình huống dở khóc dở cười.
2. **Tiếng Việt có dấu**:
   - Tên truyện phải dùng tiếng Việt có dấu chuẩn Unicode (NFC), đúng chính tả.
3. **Khoảng cách giữa các từ**:
   - Sử dụng dấu khoảng trắng (` `) giữa các từ, tuyệt đối không dùng gạch dưới `_` hay gạch nối `-` trong tên file truyện (trừ trường hợp tên riêng đặc biệt).
4. **Viết hoa (Title Case)**:
   - Viết hoa chữ cái đầu tiên của **tất cả các từ** trong tên file.
   - Ví dụ: `🍃 Chiếc Bụng Bầu Kỷ Lục Của Mẹ.md`, `🥷 Naruto Bí Thuật Nghìn Năm Đau Đớn.md`.

---

## 2. Phạm Vi Quét File

- **Nếu người dùng chỉ định file cụ thể**: Chỉ áp dụng cho file được chỉ định.
- **Nếu người dùng KHÔNG chỉ định file**: Tự động tìm và quét toàn bộ các file `.md` trong dự án.
  - *Lưu ý bỏ qua*: Các file tài liệu hệ thống như `README.md`, các file cấu hình hoặc file trong thư mục `.git`, `.obsidian`, `.agents`.

---

## 3. Quy Trình Thực Hiện Nghiêm Ngặt (2 Bước)

Khi người dùng kích hoạt skill này (bằng lệnh `/dat-ten-truyen` hoặc yêu cầu đặt tên file truyện):

### BƯỚC 1: Lập kế hoạch & Hỏi xác nhận (BẮT BUỘC DỪNG LẠI)
1. Quét danh sách các file `.md` cần đặt tên.
2. Đọc lướt nội dung/tiêu đề của từng file để chọn Emoji chính xác và chuẩn hóa tên Tiếng Việt có dấu viết hoa từng chữ.
3. Trình bày bảng **Dự định sẽ làm** rõ ràng cho người dùng:

| STT | Đường dẫn file hiện tại | Tên đề xuất mới (Emoji + Tiếng Việt Title Case) | Ghi chú / Lý do chọn Emoji |
| :---: | :--- | :--- | :--- |
| 1 | `Truyện Tranh Shin - Cậu Bé Bút Chì.md` | `🖍️ Truyện Tranh Shin - Cậu Bé Bút Chì.md` | Thêm emoji bút chì |
| ... | ... | ... | ... |

4. Xuất câu hỏi xác nhận gửi đến người dùng:
   > **"Tôi đã lên danh sách dự định đổi tên như bảng trên. Bạn có xác nhận thực hiện không? Chỉ cần bạn gõ dấu chấm `.` là tôi sẽ thực thi theo dự định đó."**
5. **DỪNG LẠI HOÀN TOÀN TẠI ĐÂY.** Không chạy lệnh đổi tên! Chờ phản hồi của người dùng.

---

### BƯỚC 2: Thực thi khi người dùng gõ `.` (Dấu Chấm)
1. Khi nhận được tin nhắn từ người dùng chỉ chứa ký tự `.` (hoặc xác nhận đồng ý thực hiện), Agent mới bắt đầu gọi lệnh PowerShell để đổi tên.
2. Lệnh đổi tên phải dùng `[System.Text.Encoding]::UTF8` và `Rename-Item -LiteralPath` để tránh lỗi font tiếng Việt và emoji trên Windows PowerShell:
   ```powershell
   Rename-Item -LiteralPath "<Đường_Dẫn_Cũ>" -NewName "<Tên_Mới_Có_Emoji>"
   ```
3. Sau khi hoàn thành, in bảng kết quả các file đã được đổi tên thành công.
