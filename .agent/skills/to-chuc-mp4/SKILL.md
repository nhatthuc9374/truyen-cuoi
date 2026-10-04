---
name: to-chuc-mp4
description: Tổ chức, gom nhóm và quản lý các file video MP4 tương tự chuẩn quản lý audio MP3 (phân nhóm theo thư mục tác giả/chủ đề, chuẩn hóa tên file, phát hiện và dọn dẹp file trùng lặp hoặc lỗi font/mojibake, tạo danh mục playlist). Luôn lập kế hoạch dự định trước, hỏi xác nhận và chỉ thực thi khi người dùng gõ dấu chấm (.).
---

# Skill: Tổ Chức File MP4 Tương Tự MP3 (`to-chuc-mp4`)

Skill này giúp quy hoạch, phân loại và chuẩn hóa toàn bộ các file video `.mp4` trong dự án tương tự như cách quản lý thư viện âm thanh `.mp3` chuyên nghiệp (phân theo tác giả/chuyên mục, dọn dẹp file rác/trùng lặp, chuẩn hóa tên file và lập danh mục quản lý).

---

## 1. Nguyên Tắc Tổ Chức File MP4 (Chuẩn Audio/Media Library)

Tương tự như cấu trúc thư viện MP3 (`Artist/Album/Track`), thư viện video MP4 được tổ chức theo mô hình phân cấp:

```text
media/
└── videos/                      (hoặc mp4/)
    ├── lam/                     # Video thuộc chuyên mục Lam
    │   ├── Chiec_Bung_Bau_Ky_Luc_150cm.mp4
    │   ├── Co_Giao_Bau_Danh_Roi_Phan.mp4
    │   ├── Toi_Va_Di_Di_De.mp4
    │   └── Toi_Va_Di_Di_De_LongTieng.mp4
    ├── nhan/                    # Video thuộc chuyên mục Nhân
    │   ├── Doraemon_Banh_Mi_Tri_Nho.mp4
    │   ├── Kiteretsu_Cuon_Tu_Dien_Ki_Bi.mp4
    │   ├── Naruto_Nghin_Nam_Dau_Don.mp4
    │   ├── Ninh_Cong_Hoang_Bi_Kip_Sinh_Ton.mp4
    │   └── Shin_Cau_Be_But_Chi_Hoan_Hao.mp4
    ├── oliver-tree/             # Video thuộc album/chuyên đề Oliver Tree
    │   ├── Oliver_Tree_Again_And_Again.mp4
    │   ├── Oliver_Tree_All_That_Alien_Boy.mp4
    │   ├── Oliver_Tree_Cash_Machine.mp4
    │   ├── Oliver_Tree_Cu_Nhay_The_Ky.mp4
    │   ├── Oliver_Tree_Out_Of_Ordinary.mp4
    │   ├── Oliver_Tree_Welcome_To_LA.mp4
    │   └── Oliver_Tree_When_Im_Down.mp4
    └── playlist.json            # Danh mục metadata video (tên, dung lượng, đường dẫn)
```

### Các nhiệm vụ chuẩn hóa:
1. **Dọn dẹp file lỗi font (Mojibake) và trùng lặp**:
   - Phát hiện các file bị lỗi bảng mã tiếng Việt (ví dụ: `Chiáº¿c bá»¥ng báº§u ká»· lá»¥c 150cm.mp4`).
   - So sánh kích thước (Length) và mã băm MD5 để xác định các bản sao chép dư thừa (ví dụ: file có dấu và không dấu bị nhân bản cùng nội dung), chỉ giữ lại 1 bản chuẩn.
2. **Quy chuẩn tên file**:
   - Tên file video sạch sẽ: PascalCase nối gạch dưới (`Ten_Video.mp4`) hoặc Tiếng Việt rõ ràng không lỗi font, phản ánh đúng nội dung.
3. **Tạo Playlist/Catalog**:
   - Xuất file danh mục `playlist.json` hoặc bảng Markdown thống kê tất cả video hiện có, kích thước và phân loại.

---

## 2. Quy Trình Thực Hiện Nghiêm Ngặt (2 Bước)

Khi người dùng kích hoạt skill này (bằng lệnh `/to-chuc-mp4` hoặc yêu cầu tổ chức video mp4):

### BƯỚC 1: Lập kế hoạch & Hỏi xác nhận (BẮT BUỘC DỪNG LẠI)
1. Quét toàn bộ file `.mp4` trong dự án.
2. Kiểm tra dung lượng (Bytes) và tên file để phát hiện các file trùng lặp (duplicate) hoặc file lỗi font tên.
3. Lập bảng **Dự định sẽ làm** chi tiết:

| STT | File MP4 hiện tại | Vị trí & Tên mới dự kiến | Thao tác dự kiến |
| :---: | :--- | :--- | :--- |
| 1 | `Truyện cười của Lam/Chiec_bung_bau_ky_luc_150cm.mp4` | `media/videos/lam/Chiec_Bung_Bau_Ky_Luc_150cm.mp4` | Di chuyển & Chuẩn hóa |
| 2 | `Truyện cười của Lam/Chiáº¿c bá»¥ng báº§u...mp4` | *(Xóa bỏ)* | Xóa bản trùng lặp lỗi font |
| 3 | `Truyện cười của Nhân/doraemon_banh_mi_tri_nho.mp4` | `media/videos/nhan/Doraemon_Banh_Mi_Tri_Nho.mp4` | Di chuyển vào nhóm Nhân |
| ... | ... | ... | ... |

4. Xuất câu hỏi xác nhận gửi đến người dùng:
   > **"Tôi đã lên dự định tổ chức và dọn dẹp các file MP4 như bảng trên. Bạn có xác nhận thực hiện không? Chỉ cần bạn gõ dấu chấm `.` là tôi sẽ thực thi theo dự định đó."**
5. **DỪNG LẠI HOÀN TOÀN TẠI ĐÂY.** Không di chuyển hay xóa bất kỳ file video nào ở bước này! Chờ phản hồi của người dùng.

---

### BƯỚC 2: Thực thi khi người dùng gõ `.` (Dấu Chấm)
1. Khi nhận được tin nhắn từ người dùng chỉ chứa ký tự `.` (hoặc xác nhận đồng ý thực hiện):
2. Tạo các thư mục đích trong `media/videos/`.
3. Di chuyển và đổi tên các file MP4 chuẩn. Xóa an toàn các file trùng lặp đã được liệt kê trong bảng kế hoạch.
4. Tạo/cập nhật file `media/videos/playlist.json` ghi lại danh sách toàn bộ video.
5. In bảng kết quả tổng kết số video đã di chuyển, số file trùng đã dọn dẹp và đường dẫn thư viện mới.
