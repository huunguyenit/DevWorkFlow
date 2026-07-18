<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Identity "MPSRelease">
]>

<dir table="mpctyc" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Planned Order"></title>
  <fields>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Request Date From"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Request Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Request Date to"></header>
    </field>

    <field name="kh_sx" dataFormatString="0,1" clientDefault="1" align="right">
      <header v="Kế hoạch sản xuất" e="Planned Order"></header>
      <footer v="1 - Chỉ lọc đơn hàng xác nhận, 0 - Tất cả" e="Planned Order: 1 - Firmed Planned Order, 0 - All"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11100: [kh_sx].Label, [kh_sx], [kh_sx].Description"/>
    </view>
  </views>
  <commands>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6YXEHZUpwAPZqJ0YlO12Soq5n7+YmehnF8gPQMW/Dbzq/un7V8pKL5yZ1wBdMW1WjWwMJcALf/KvScY7xIFjXHRBFsCa6/JGqUHms8Rrn1GdlJVQ/hLY9sVf1edW+L2fqWaCmUKfF5+OAm1cZ9oQy0Y2fAJzwfawBLvurqQHtXq55c+KBpuIAZe7M0wkXpQQOqJmo4FkoxXdHuf6/OSJMWs=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjnHJAuoQzfeROKYc0mdV+y6YuIzo+LO5yN24egzCBavEaPb8w/lxWS6YTut8zD17sc4/0GeSFR7sKlKcNGpABJJsdnTRpjhTtnjbLA8BCf3YqpuplQxSNVi5y3kGghVo71WYUf+15hSN5FbYhHWwvGgvYOblh0ME7lDBatPZ21S+ElADlTCX4rrLszZjZ11jr0rN+hmNMNRx/JU+O1tCE7GRUYhn5YZ9wazyb1gINTCI</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ETbhk+SJrKIRGCKN+eMCJxB37ZnZO4VYMF0TOK4x/yy</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjnHJAuoQzfeROKYc0mdV+y6WC3kvVfiDyoocUmLu/GrsyxLKlTPlFNXcH5u1lUKzt/xz+OZjG7y/iClGxKNnKrFIoKtwm8+c7kNDE8qs9N+ccixA7mHMKwvALYZWV8qoCyhhdEoURwS1tyncC/hkD5nNNCfNtTrlQw7Yg0vxh/L3/5+sIikMtdf2hOdhLqgcr8uNLW46rxi9+XN85uzZnklkVmOHdfO6PoXmzTYsOtjyZP1xC/ZjRhsg/ZGtfzfYRQmrBRjZPruoeZCzXnOCXp8=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjs8cBFdYIjrEvH6QghTKUdyHruYa1kryktbZ2rlNYPfbeiePUUxnNkGsPVyjITmklQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjsDJXojFZ/PDmGU0rQ/XeZSozu5EJHwj61UgAESX5ehYz+vYaByMjGRlqRt9puTc4w==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjtTXA6p5z+XVSu7BG+MF+ycU4Hu+oqYtFCcldzipkF/ph9pZjhLcjwjmEkoqkSjQ7L2npQxX/G3ytRlBbshQiec=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjtTXA6p5z+XVSu7BG+MF+ycTjhPuX+rW1qgdU79H2g5owK/ZWlEC/MwtXARegTnLvA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9NPqy8Xf1ae1vxsCwTpbyLJXIRssO2CZ4qQ7keWUjmyg9tzW/oUYMuLiiV+Y/dx1BA==</encrypted>]]>
    </text>
  </script>
</dir>