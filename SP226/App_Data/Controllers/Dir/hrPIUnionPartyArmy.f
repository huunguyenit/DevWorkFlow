<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnv" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin đảng, đoàn, quân đội" e="Party, Union, Army Service Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="thanh_phan_gd">
      <header v="Thành phần gia đình" e="Family Background"/>
    </field>
    <field name="thanh_phan_bt">
      <header v="Thành phần bản thân" e="Personal Background"/>
    </field>
    <field name="dang_vien_yn" type="Boolean">
      <header v="Đang là đảng viên" e="Party Member"/>
      <items style="CheckBox"/>
    </field>
    <field name="ngay_vao_dang" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào đảng" e="Join Date"/>
    </field>

    <field name="ngay_vd_chinh_thuc" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày chính thức" e="Official Admitted Date"/>
    </field>
    <field name="noi_ket_nap" categoryIndex="1">
      <header v="Nơi kết nạp" e="Place of Admission"/>
    </field>
    <field name="so_the_dang" categoryIndex="1">
      <header v="Số thẻ đảng" e="Party Card No."/>
    </field>
    <field name="chuc_vu_dang" categoryIndex="1">
      <header v="Chức vụ hiện tại" e="Current Position"/>
    </field>
    <field name="chuc_vu_dang2" categoryIndex="1">
      <header v="Chức vụ cao nhất" e="Highest Position"/>
    </field>
    <field name="trinh_do_ly_luan" categoryIndex="1">
      <header v="Trình độ lý luận" e="Political Theory Level"/>
    </field>
    <field name="ngay_ra_dang" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày ra khỏi đảng" e="Leaving Date"/>
    </field>
    <field name="ghi_chu_dd2" rows="2" categoryIndex="1">
      <header v="Ghi chú" e="Note"/>
    </field>

    <field name="doan_vien_yn" type="Boolean" categoryIndex="2">
      <header v="Đang là đoàn viên" e="Union Member"/>
      <items style="CheckBox"/>
    </field>
    <field name="ngay_vao_doan" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="2">
      <header v="Ngày vào đoàn" e="Join Date"/>
    </field>
    <field name="chuc_vu_doan" categoryIndex="2">
      <header v="Chức vụ hiện tại" e="Current Position"/>
    </field>
    <field name="chuc_vu_doan2" categoryIndex="2">
      <header v="Chức vụ cao nhất" e="Highest Position"/>
    </field>
    <field name="ngay_ra_doan" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="2">
      <header v="Ngày ra khỏi đoàn" e="Leaving Date"/>
    </field>
    <field name="ghi_chu_dd1" rows="2" categoryIndex="2">
      <header v="Ghi chú" e="Note"/>
    </field>

    <field name="nhap_ngu_yn" type="Boolean" categoryIndex="3">
      <header v="Đã nhập ngũ" e="Army Joined"/>
      <items style="CheckBox"/>
    </field>
    <field name="ngay_nhap_ngu" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="3">
      <header v="Ngày nhập ngũ" e="Join Date"/>
    </field>
    <field name="quan_ham" categoryIndex="3">
      <header v="Quân hàm cao nhất" e="Highest Rank"/>
    </field>
    <field name="ngay_xuat_ngu" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="3">
      <header v="Ngày xuất ngũ" e="Date of Discharge"/>
    </field>
    <field name="ghi_chu_dd3" rows ="2" categoryIndex="3">
      <header v="Ghi chú" e="Note"/>
    </field>

  </fields>

  <views>
    <view id="Dir" height="236">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="11000: [thanh_phan_gd].Label, [thanh_phan_gd]"/>
      <item value="11000: [thanh_phan_bt].Label, [thanh_phan_bt]"/>

      <item value="11--1: [dang_vien_yn].Label, [dang_vien_yn], [stt_rec]"/>
      <item value="110--: [ngay_vao_dang].Label, [ngay_vao_dang]"/>
      <item value="110--: [ngay_vd_chinh_thuc].Label, [ngay_vd_chinh_thuc]"/>
      <item value="11000: [noi_ket_nap].Label, [noi_ket_nap]"/>
      <item value="110--: [so_the_dang].Label, [so_the_dang]"/>
      <item value="11000: [chuc_vu_dang].Label, [chuc_vu_dang]"/>
      <item value="11000: [chuc_vu_dang2].Label, [chuc_vu_dang2]"/>
      <item value="11000: [trinh_do_ly_luan].Label, [trinh_do_ly_luan]"/>
      <item value="110--: [ngay_ra_dang].Label, [ngay_ra_dang]"/>
      <item value="110000: [ghi_chu_dd2].Label, [ghi_chu_dd2]"/>

      <item value="11---: [doan_vien_yn].Label, [doan_vien_yn]"/>
      <item value="110--: [ngay_vao_doan].Label, [ngay_vao_doan]"/>
      <item value="11000: [chuc_vu_doan].Label, [chuc_vu_doan]"/>
      <item value="11000: [chuc_vu_doan2].Label, [chuc_vu_doan2]"/>
      <item value="110--: [ngay_ra_doan].Label, [ngay_ra_doan]"/>
      <item value="110000: [ghi_chu_dd1].Label, [ghi_chu_dd1]"/>

      <item value="11---: [nhap_ngu_yn].Label, [nhap_ngu_yn]"/>
      <item value="110--: [ngay_nhap_ngu].Label, [ngay_nhap_ngu]"/>
      <item value="11000: [quan_ham].Label, [quan_ham]"/>
      <item value="110--: [ngay_xuat_ngu].Label, [ngay_xuat_ngu]"/>
      <item value="110000: [ghi_chu_dd3].Label, [ghi_chu_dd3]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Đảng" e="Party"/>
        </category>
        <category index="2" columns="120, 25, 75, 100, 100, 130">
          <header v="Đoàn" e="Union"/>
        </category>
        <category index="3" columns="120, 25, 75, 100, 100, 130">
          <header v="Quân đội" e="Army Service"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2xw7klxrrfK9GCH75IKMeBSu5XuLn+lm3ll7PvbHhPDCUgYYfGo+MCrpEK+FnZMV0xdgKZNrh5zyMD91hEHRSA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7WybsZ2xBtNflOK6tdJnZ4Lp52fasFXe99ZUMRwadn0+oprtxGQEe5XFz8/JRx/WD9Ci0d0jtGaoIlLbBjv10M=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6AV2m8bLVesUEa17mg8ne+V9SJVWNek5U0F1j4kAjz1g9nyx3LvrlINwlj6quVeC004E/v4UtgFVb+/z5PY74GmoVjfLxKzoRYq31DphXGG</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZkBRCa01rkzpFulHcEdAz3pIezxTgQSwqd22st7ONOzHdZpY2z6qGWPDBPbMgJ5k2Yi3auc6tM5Wf1u7K+cCRA7+GVXxddTeKenU6rA7YgVLQfqvo/INSoiGvIuF3qvNUYsZHops3ftnXN//yqW8DeT3+tNgaMS9YLlP8U82f9Fozy8dR6E56o9CVREFGgaQivzBSFsd8et+2YBKOk4g/2a3K4uVYRm6NUp/n73nOaFBJjkaf28lAn57E5qejEWJaWM7hNB5f75Ennu4GL2dv4xCsmytj5ENAnWvZsnIfPJUA==</encrypted>]]>
    </text>
  </script>

</dir>