<?xml version="1.0" encoding="utf-8"?>

<dir table="hrcthd" code="stt_rec, ngay_ky_hd" order="stt_rec, ngay_ky_hd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin hợp đồng" e="Labor Contract"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ky_hd" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" categoryIndex="1">
      <header v="Ngày ký hợp đồng" e="Date Signed"></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQz0YVzPkeQcqhrppW1rSmm8EHFUN779WYYnGOBnxYtRSXZOawNsuvbc77xX5Bg26QL1J2IinU55mgbGujBiQNo=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="dia_chi_th_tru">
      <header v="Hộ khẩu" e="Permanent Residence"></header>
    </field>
    <field name="cmnd_so">
      <header v="Số CMND/Hộ chiếu" e="ID Card/ Passport No."></header>
    </field>
    <field name="cmnd_ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="cmnd_noi_cap">
      <header v="Nơi cấp" e="Place of Issue"></header>
    </field>

    <field name="so_ld" clientDefault="Default" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="Số sổ lao động" e="Labor Book No."></header>
      <items style="Mask"/>
    </field>
    <field name="so_ngay_cap" clientDefault="Default" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày cấp sổ" e="Date of Issue"></header>
    </field>
    <field name="so_noi_cap" clientDefault="Default" categoryIndex="1">
      <header v="Nơi cấp sổ" e="Place of Issue"></header>
    </field>

    <field name="thanh_nien_yn" type="Boolean" categoryIndex="1">
      <header v="Lao động chưa thành niên" e="Minor Labor"></header>
    </field>
    <field name="tan_tat_yn" type="Boolean" categoryIndex="1">
      <header v="Lao động tàn tật" e="Handicap Labor"></header>
    </field>

    <field name="so_hdld" clientDefault="Default" categoryIndex="1" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã số hợp đồng" e="Labor Contract No."></header>
      <items style="Mask"/>
    </field>
    <field name="loai_hd" clientDefault="Default" categoryIndex="1" allowNulls="false">
      <header v="Loại hợp đồng" e="Contract Type"></header>
      <items style="AutoComplete" controller="hrContractType" key="status = 1" check="1 = 1" reference="ten_loai%l" information="ma_loai$hrdmloaihd.ten_loai%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZd7bo6dshcQa5FpL9asEZ4SPvtHe+brL2EfeWs5hv8PYfW4Ie+l/dk/HgYGUbuKaOQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ngay_lv_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày làm việc từ/đến" e="Working Date from/to"></header>
    </field>
    <field name="ngay_lv_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tv_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày thử việc từ/đến" e="Probation Date from/to"></header>
    </field>
    <field name="ngay_tv_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"></footer>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>

    <field name="dia_diem" clientDefault="Default" categoryIndex="2">
      <header v="Địa điểm" e="Workplace"></header>
    </field>
    <field name="dia_diem2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="chuc_danh" clientDefault="Default" categoryIndex="2">
      <header v="Chức danh chuyên môn" e="Job Title"></header>
    </field>
    <field name="chuc_danh2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="chuc_vu" clientDefault="Default" categoryIndex="2">
      <header v="Chức vụ" e="Job Position"></header>
    </field>
    <field name="chuc_vu2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="nghe_nghiep" clientDefault="Default" categoryIndex="2">
      <header v="Nghề nghiệp" e="Occupation"></header>
    </field>
    <field name="nghe_nghiep2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="cong_viec" clientDefault="Default" categoryIndex="2">
      <header v="Công việc phải làm" e="Required Tasks"></header>
    </field>
    <field name="cong_viec2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="thoi_gian" clientDefault="Default" categoryIndex="2">
      <header v="Thời gian làm việc" e="Working Time"></header>
    </field>
    <field name="thoi_gian2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="dung_cu" clientDefault="Default" categoryIndex="2">
      <header v="Dụng cụ làm việc" e="Working Tools"></header>
    </field>
    <field name="dung_cu2" clientDefault="Default" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="phuong_tien" clientDefault="Default" categoryIndex="7">
      <header v="Phương tiện làm việc" e="Means of commutation"></header>
    </field>
    <field name="phuong_tien2" clientDefault="Default" categoryIndex="7">
      <header v="" e=""></header>
    </field>
    <field name="muc_luong" clientDefault="Default" categoryIndex="7">
      <header v="Mức lương" e="Base Salary"></header>
    </field>
    <field name="muc_luong2" clientDefault="Default" categoryIndex="7">
      <header v="" e=""></header>
    </field>
    <field name="tien_thuong" clientDefault="Default" categoryIndex="7">
      <header v="Tiền thưởng" e="Bonus"></header>
    </field>
    <field name="tien_thuong2" clientDefault="Default" categoryIndex="7">
      <header v="" e=""></header>
    </field>
    <field name="phu_cap" clientDefault="Default" categoryIndex="7">
      <header v="Phụ cấp" e="Allowances"></header>
    </field>
    <field name="phu_cap2" clientDefault="Default" categoryIndex="7">
      <header v="" e=""></header>
    </field>
    <field name="bao_ho_ld" clientDefault="Default" categoryIndex="7">
      <header v="Bảo hộ lao động" e="Protection equipments"></header>
    </field>
    <field name="bao_ho_ld2" clientDefault="Default" categoryIndex="7">
      <header v="" e=""></header>
    </field>
    <field name="thoa_thuan" clientDefault="Default" categoryIndex="7">
      <header v="Thỏa thuận khác" e="Other Agreement"></header>
    </field>
    <field name="thoa_thuan2" clientDefault="Default" categoryIndex="7">
      <header v="" e=""></header>
    </field>

    <field name="quoc_tich" external="true" defaultValue="''" categoryIndex="9">
      <header v="Quốc tịch" e="Nationality"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="null" categoryIndex="9">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="noi_sinh" external="true" defaultValue="''" categoryIndex="9">
      <header v="Nơi sinh" e="Place of Birth"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="110100-1: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="11000000: [dia_chi_th_tru].Label, [dia_chi_th_tru]"/>
      <item value="110-----: [cmnd_so].Label, [cmnd_so]"/>
      <item value="110-----: [cmnd_ngay_hl].Label, [cmnd_ngay_hl]"/>
      <item value="11000000: [cmnd_noi_cap].Label, [cmnd_noi_cap]"/>

      <item value="110-----: [so_ld].Label, [so_ld]"/>
      <item value="110-----: [so_ngay_cap].Label, [so_ngay_cap]"/>
      <item value="11000000: [so_noi_cap].Label, [so_noi_cap]"/>
      <item value="-1100000: [thanh_nien_yn], [thanh_nien_yn].Label"/>
      <item value="-1100000: [tan_tat_yn], [tan_tat_yn].Label"/>

      <item value="110-----: [so_hdld].Label, [so_hdld]"/>
      <item value="11010000: [loai_hd].Label, [loai_hd], [ten_loai%l]"/>
      <item value="1101----: [ngay_lv_tu].Label, [ngay_lv_tu], [ngay_lv_den]"/>
      <item value="1101----: [ngay_tv_tu].Label, [ngay_tv_tu], [ngay_tv_den]"/>
      <item value="1101----: [ngay_hl_tu].Description, [ngay_hl_tu], [ngay_hl_den]"/>
      <item value="110-----: [ngay_ky_hd].Label, [ngay_ky_hd]"/>

      <item value="1100-100: [dia_diem].Label, [dia_diem], [dia_diem2]"/>
      <item value="1100-100: [chuc_danh].Label, [chuc_danh], [chuc_danh2]"/>
      <item value="1100-100: [chuc_vu].Label, [chuc_vu], [chuc_vu2]"/>
      <item value="1100-100: [nghe_nghiep].Label, [nghe_nghiep], [nghe_nghiep2]"/>
      <item value="1100-100: [cong_viec].Label, [cong_viec], [cong_viec2]"/>
      <item value="1100-100: [thoi_gian].Label, [thoi_gian], [thoi_gian2]"/>
      <item value="1100-100: [dung_cu].Label, [dung_cu], [dung_cu2]"/>

      <item value="1100-100: [phuong_tien].Label, [phuong_tien], [phuong_tien2]"/>
      <item value="1100-100: [muc_luong].Label, [muc_luong], [muc_luong2]"/>
      <item value="1100-100: [tien_thuong].Label, [tien_thuong], [tien_thuong2]"/>
      <item value="1100-100: [phu_cap].Label, [phu_cap], [phu_cap2]"/>
      <item value="1100-100: [bao_ho_ld].Label, [bao_ho_ld], [bao_ho_ld2]"/>
      <item value="1100-100: [thoa_thuan].Label, [thoa_thuan], [thoa_thuan2]"/>

      <item value="110----1: [quoc_tich].Label, [quoc_tich], [ten_bp%l]"/>
      <item value="110-----: [ngay_sinh].Label, [ngay_sinh]"/>
      <item value="11000000: [noi_sinh].Label, [noi_sinh]"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130, 0, 0">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 111, 8, 100, 111, 0, 0">
          <header v="Công việc" e="Working"/>
        </category>
        <category index="7" columns="120, 30, 70, 111, 8, 100, 111, 0, 0">
          <header v="Thỏa thuận" e="Agreement"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130, 0, 0">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XvDEmMtpJSQZ+WgYEqE6mHK4u5Rb09rBNYYnj6In8J92Me/ve+VfT3sYl+VoAApF1e1qK0Yue6zOF4AmwZtyLrUsb/C/D7pEbwWEVcJxkAxUPKVIfug97/wDgjIRQNsBVZwOSCcWv0Znk7mZ6dQQKEea0QVDqNA3dU0skQfeO3wp5tEIdtY9w4RM48isdlUkcbuONQA/g2ZNJ1NTVbOZAXEXihLr0YUaKkr4AkeiUB6iT+OIKvBX4XLs7CvWsreLrY+wFtvy6/t81IcaG87rC3NW21NmJZYtPJbE39KGDNc5H+CsvvI5D+46U6nSoLcwg==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1d8MM7FUdTcFelcR25hsAXv0Q8CHTG0nduWbe5blnOn47zxPHaEPqYtM5IV6kIXjSU7zNehuIvytq4MTRNJ3dc=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/8wIu78bHFA3hKXmMxW5MSkkX9ryk6rb3TFVJQ80eTTDPRc8y8Mn2rusk+pH0pFQAn1OD9v7wsGFiNIP5X9lgc=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zeE5NwixOXrT7cYtev0ZJ3dZdOGQX3xoP2C16Pg3KWcTUPAy9XUBn9VzzebsHuw7Bic4ZGtFGZNoFa7+HdB9AStKeh3E1aRjob8vC0AK1bOSvD13zsXz73EclaJsMk4LRpaMgcSJx8Ana+NtVNXjFR4zlkswfhqh7iXNMn0muRN+hRuo+2XRt1Sd3NcA3PgLpgY9TXtlMLT2bD3zQC3sWL1uq9zihkwB9UAjeHwTN3bOXPJtns6sA03wdCgNp+4iwDbYJCU1/fpv49NjmgBI9mIkPUuv4QGxgcQ6aMV6lkIr3kyQSH41CXopHm4ASVeEwFAjYYCsOc1Ffie/7iH0y/NC2Aduyk3pd9X6HOAJU70UJ6XNBTLXOO4D/jkQy3XHSap9+7tI0zhGa/BaBsVsunXSc8BIFAffo8URzNJOMu5rWeml44oB1YYqOV2HdPGAo</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/csLLYvn/x9xwZK8wnPJcxRlsZUkDTmp0lbG0KQV9A8PibaXXB9YS7UQQBk1EEfKNe+VYyelpolv/pd1ABCGJBN512oQfVfFfsvNqoo7DEyddEdHLoFzpioccI9W0FstETCWdI0jOFo78GTBUScqik3mQ9ZMdlAI/sk36jjUdbpU0UQSiVGvsuqWllTKjSXGkO8Hx2jebyzRGAbXcngHWqrWcjbY5t3Vi6jHGZEd1E8si2CMrhhACsZdn2aIXIp6ogjakBhIWO4zuum391xTTtCIv9fOWGNt6qIFDVRxWvRiDDNaKdp5NenrQa11ED0zj6DmrybtW/2ZCiYLIhgmCxasP7ZxXUORnpkHarfCvJPmUA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q2+sU92vX19LnTogCSYIo6gLtyHdbwmmAlGqla43Xos5UxiW/DCCwnzkSfgK37OjiR69H1pRcsIpkgQJodI/gcfcnRqqFsXSHWgchg9Lg0GPrgydAfx1QrIAmBq3QSKD5rnOYkSrzOUD86PY77ef2MaiKPU7VQ7Sewa0FhjXaqVBVAnQVaZkTwYjT9EKNtq/eKA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4n7dXElil6WVxebTA09gxhBKQJskU80aVjRlKL7GzUa5wZMGVi39trZS2ARSqd32y6hENOEISEjCiRxDlkQ/yhxFtYxM8+Bc+lreowgi6PzIkBjDxVcgVD7D06qnSFmW4EPhiQYwUQbXWYjt+IF/PbvtfZRp4lKqyBEKnQRAMbhwsrI1dfDjpBMlDG0adC3NgMSYNaCB4PTY+iMppg4TGkXdoow5Y3t4GssDCp3MqtQc4LkN1v1AxHyctsLIyudnsI5cwGJpRIgN3yEUvTn9KU8sX2Qd3A9weYgsd5Fw6OV//FzdnY9xHEDSdHG+rGM9Vw</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgbca866Jy34A47Q+q09MXJULs+qwwIV9Qmxd9deLUEHyQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FhiEXwXl12ljo/2/OoYhCREh0gMfxVyWuHBUMuep+3vSg2WnVsNXtWCmM5wTdy8+dcPpvWwR5ZrbHIavKLdmcNio2PW1xeIid0RidrKWUbGWa+xxtcTdjQJHwpOMFcpo/crkfeKOf1CUy19CtoC6v55mP56KY7zSHhDdtJsffirYAZ3maVpmKxSjHGgVS2pBuhOghtJNoWky/ZWeUuuBS4LVTZzA024sj1qic1vCaXqZEcCvqa+tS+IBq8g+Wy+84dOCxLbtWWj1WMtRpwX0lmc8CPBY0ve6uAz1n6VFPzLSbopuw9Zyc5f8rPNLxsDEvjpc20hYjgQLMgYGrSowO3WIcwx474Zn4/U+j9kNFLSDd4+5M88hCWIUx3sc6w6AgYFa64+oZGIaxWOp+gdM/WWmlGIloXYvX9o7ozT3c9WwZ3CIUzyofyDn3LSa3sgTSoFjWI/o0eV+5nbaHh81fRrKM79E5/Eb/kRnIBp5Q4Zx70LBdTxZjLVCo5W+LVkqoUyWTE0opcXPRq/zgqVETJkN0RftKKF1bbcxKFHLUz8EcvmBnsnq0cdDRTqi2PswkoYz4qaK0Qq6yPapVPvErYxCQnY23VEmKFtf3XaNmxqto6qmQWpiNWI/paZM3kEPpT/MlZCZks1fAIN/rT7oJ/KOVWGBjiW9D6y5MurGA5OrnKfrJDHY1Wvp1kSACOGBuQj4pDGNPQbOBNzw01Hh14p+f2sZlnycyrvhrygEw+28HvPl1ZH+V/iY21TQnDP/qMxih3OJMMiGJetFVIpHmy8HjVg+ECZ8j/Xt36oTeN3bUSJhGQRiHyNpREMpdw5T52xKS96cXJnEz//utmKrfAROczI69miZpEgr8m32eR2s9d/LBOrLWK5kFO5JFEhEqk+6Y8ibt4TyYR0fL6xEZJ/d0oaWq23bwae8pzuvLbgbeWNhVBD0c2T6Yc21tsLST+wEDU6OxGF2rMFp0Acc7QSM5Fb011bSt3MNwuToSDE5oLKgmPToCNqFQXyMkmARdpeaYSj/M3JLqnXwPgdoeFUbzbJV7LQiUtLHHxQ8yEydARBZf3GS2AblZOo2Lw+1uMOVgEL065BJIyhHZnUEKSJbQ7crzYuCH2EujjrHbgHFn+vhMqZJxpqk6b4ULrMR4oVD57Xv1Agj3uIe2h+jVcyo0/tkIfkpGpUbZyq24WSeLYPKrhmuUT1SJcJ9xXpsdZ5nlwqnxCAohQPQljLDoAwQTOBlSBENqW16alOr2BNNJL/BSwwrGaMkS9LaYVkWg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNcBqKLEU9wRjw9uy0XNP4941yxo2A9vFCYqn36IAKVtdZUm6fKLl/yFkgq6PYbtqHNNyA66r/2jY0goZCXdy6eBkLx0Nvd2+MUm1Jw5ch+szkjKszblJmkB1JdezeGZD5AHTOqR/SED0jUk1BdzIPV0eEMqGoUrvanGGK8CyIw/HixcxnUsCRYgExleFO3OnkQDSWPGt2FKfrpcmyWCe2Lx8rYXF+OFXPX/Xq+3Rtx0T/Bo2unAR+k9vg4iz6m9gqH83DkQqPHUZAcyQliRgRRipULPAqz3kBrmZMQ09ElEwYrG66dYzlq7akBumy0kdSxlBvIw5CGgnxQp6rJ3U9kMppXw2SlNixeKwdbICIDKNgKp9wQYJIqu2vr+CwTqYSa5LEcCt8O0B/0AT29TB/UepPHl9sMP+GpJQLuqu4+8wmoOJaSX+61aks9+qpV/Qn5Z2UiuJ2pFra2mOMtR9aeljuopicsanRAI1s1mBkNk0vEa+5dVaz4TJPGMdVeVU9vrnPkogCxi78knwQDU7rQXlfZj+JqlDTQwIBuE7RRMG812fJpyx3hwSgRBPr7fYTWWMIZDnyutWLvfKBsHCXgpfmW3uiHXH2obnuge5udhwiumq4lJqiJxTqOHrZiKWe4y9UtvKXJFH1TLpQX/GrBY=</encrypted>]]>
      </text>
    </action>

    <action id="ContractType">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK40AtdlUFSam4U2yIVtP7NfRUmWh45Hq6/7gZVgvbNoKNEkOvOfUUzU375p94vLVUvDUkhqnq97W2eJOKoUA8DNJAt39LuAsuDN4iZVt0cGpg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>