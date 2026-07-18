<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GByKZ89z3nJDLyLM5gshFlQFqMf92+LgQtNdig+UZro7lLz4tYNCLQPSW/ldU3lQ1NUL2s8U6pPCXn0Ytvr7N+aqA6vrYPKgzeQrN59x4H/8FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrTMCourseInformation;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hrdtkh" code="stt_rec" order="ngay_ct, ma_khoa" id="H08" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin khóa học" e="Training Course Information"></title>
  <partition table="hrdtkh" prime="hrdtkh" inquiry="hridtkh" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_khoa" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã khóa học" e="Course Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_khoa" allowNulls="false">
      <header v="Tên khóa học" e="Course Name"></header>
    </field>
    <field name="ten_khoa2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_mh" allowNulls="false">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status='1'" check="1=1" information="ma_mh$hrdmmh.ten_mh%l"/>
    </field>
    <field name="ten_mh%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvdt" allowNulls="false">
      <header v="Đơn vị đào tạo" e="Training Provider"></header>
      <items style="AutoComplete" controller="hrTMProvider" reference="ten_dvdt%l" key="status='1'" check="1=1" information="ma_dvdt$hrdmdvdt.ten_dvdt%l"/>
    </field>
    <field name="ten_dvdt%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_hinh_dt" allowNulls="false">
      <header v="Loại hình đào tạo" e="Training Type"></header>
      <items style="AutoComplete" controller="hrTMTypeList" reference="ten_loai%l" key="status='1'" check="1=1" information="ma_loai$hrdmlhdt.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Kế hoạch" e="1. Planned"/>
        </item>
        <item value="2">
          <text v="2. Đang thực hiện" e="2. Opening"/>
        </item>
        <item value="4">
          <text v="4. Hủy" e="4. Cancelled"/>
        </item>
        <item value="3">
          <text v="3. Hoàn thành" e="3. Completed"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d08" external="true" clientDefault="0" defaultValue="0" rows="235" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrTMCourseInformationDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r08" external="true" clientDefault="0" defaultValue="0" rows="235" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Nguồn lực" e="Resource"></label >
      <items style="Grid" controller="hrTMCourseInformationResource" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="giang_vien" categoryIndex="3">
      <header v="Giảng viên" e="Trainer"></header>
    </field>
    <field name="doi_tuong" categoryIndex="3">
      <header v="Đối tượng đào tạo" e="Trainees"></header>
    </field>
    <field name="ngay_du_kien1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" categoryIndex="3">
      <header v="Ngày dự kiến từ" e="Planned Date from"></header>
      <footer v="Dự kiến từ/đến" e="Plan from/to"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4svk4q1G4Dj5e4cZT2iiYCxOW7eGGIO/8LfkloE88RFgNmuC/Isgs25c50OI6qvJE=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_du_kien2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" categoryIndex="3">
      <header v="Ngày dự kiến đến" e="Planned Date to"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4svk4q1G4Dj5e4cZT2iiYCOR9GL1jPnBn0eCWrTT4nUuSvBqd3WBa8K+WoHUfJj9Q=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_dang_ky1" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="3">
      <header v="Ngày đăng ký từ" e="Booking Date from"></header>
      <footer v="Đăng ký từ/đến" e="Booking from/to"/>
    </field>
    <field name="ngay_dang_ky2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="3">
      <header v="Ngày đăng ký đến" e="Booking Date to"></header>
    </field>
    <field name="ngay_hoc1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" categoryIndex="3">
      <header v="Ngày học từ" e="Training Date from"></header>
      <footer v="Ngày học từ/đến" e="Training from/to"/>
    </field>
    <field name="ngay_hoc2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" categoryIndex="3">
      <header v="Ngày học đến" e="Training Date to"></header>
    </field>
    <field name="dia_diem" categoryIndex="3">
      <header v="Địa điểm học" e="Training Center"></header>
    </field>

    <field name="so_gio" type="Decimal" dataFormatString="# ### ##0.00" defaultValue="0" categoryIndex="18">
      <header v="Tổng số giờ học" e="Training Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hv_dk" type="Decimal" dataFormatString="# ### ### ##0" defaultValue="0" categoryIndex="18">
      <header v="Sl học viên dự kiến" e="P No. of Trainees"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tDnzfIcR/q1u09rXi8ip8Oh3pnmuFHfpnONwVz3/vsLJ9qUr4Exu4Ue/PpgGWQ2A=</Encrypted>]]></clientScript>
    </field>
    <field name="sl_hv_tt" type="Decimal" dataFormatString="# ### ### ##0" defaultValue="0" categoryIndex="18">
      <header v="Sl học viên thực tế" e="A No. of Trainees"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tDnzfIcR/q1u09rXi8ip8Hodvc4e20eSbl5zrohEJliC5ps/h9qq0Sz7TkHM6Zko=</Encrypted>]]></clientScript>
    </field>
    <field name="cp_dk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0" categoryIndex="18">
      <header v="Cp dự kiến 1 hv" e="Plan Cost/Trainee"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tDnzfIcR/q1u09rXi8ip8Oh3pnmuFHfpnONwVz3/vsLJ9qUr4Exu4Ue/PpgGWQ2A=</Encrypted>]]></clientScript>
    </field>
    <field name="cp_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0" categoryIndex="18">
      <header v="Cp thực tế 1 hv" e="Act. Cost/Trainee"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tDnzfIcR/q1u09rXi8ip8Hodvc4e20eSbl5zrohEJliC5ps/h9qq0Sz7TkHM6Zko=</Encrypted>]]></clientScript>
    </field>
    <field name="t_cp_dk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0" categoryIndex="18">
      <header v="Tổng cp dự kiến" e="Total Planned Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0" categoryIndex="18">
      <header v="Tổng cp thực tế" e="Total Actual Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ho_tro" type="Decimal" dataFormatString="##0" defaultValue="Default" clientDefault="100" categoryIndex="18">
      <header v="Công ty hỗ trợ" e="Company Support"></header>
      <footer v="(%)" e="(%)"></footer>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="295" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="11----10-11: [ma_khoa].Label, [ma_khoa], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="11000-11001: [ten_khoa].Label, [ten_khoa], [status].Label, [status], [ma_dvcs]"/>
      <item value="11000-----1: [ten_khoa2].Label, [ten_khoa2], [cookie]"/>
      <item value="11100: [ma_mh].Label, [ma_mh], [ten_mh%l]"/>
      <item value="11100: [ma_dvdt].Label, [ma_dvdt], [ten_dvdt%l]"/>
      <item value="11100: [loai_hinh_dt].Label, [loai_hinh_dt], [ten_loai%l]"/>

      <item value="1: [d08]"/>

      <item value="1: [r08]"/>

      <item value="11000: [giang_vien].Label, [giang_vien]"/>
      <item value="11000: [doi_tuong].Label, [doi_tuong]"/>
      <item value="111: [ngay_du_kien1].Description, [ngay_du_kien1], [ngay_du_kien2]"/>
      <item value="111: [ngay_dang_ky1].Description, [ngay_dang_ky1], [ngay_dang_ky2]"/>
      <item value="111: [ngay_hoc1].Description, [ngay_hoc1], [ngay_hoc2]"/>
      <item value="11000: [dia_diem].Label, [dia_diem]"/>

      <item value="11: [so_gio].Label, [so_gio]"/>
      <item value="11: [sl_hv_dk].Label, [sl_hv_dk]"/>
      <item value="11: [sl_hv_tt].Label, [sl_hv_tt]"/>
      <item value="11: [cp_dk].Label, [cp_dk]"/>
      <item value="11: [cp_tt].Label, [cp_tt]"/>
      <item value="11: [t_cp_dk].Label, [t_cp_dk]"/>
      <item value="11: [t_cp_tt].Label, [t_cp_tt]"/>
      <item value="111: [tl_ho_tro].Label, [tl_ho_tro], [tl_ho_tro].Description"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Nguồn lực" e="Resource"/>
        </category>
        <category index="3" columns="100, 100, 100, 137, 100, 8, 100, 8, 100" anchor="4">
          <header v="Thông tin chung" e="Information"/>
        </category>

        &ListCategory;
        &PostCategory;
        <category index="18" columns="100, 100, 100, 137, 100, 8, 100, 8, 100" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlZeUZOV5tyjxTCui6Hv2VLgiPWHpFJO7TH4WWYA6cHlO7gyvehWP+NDG6opCIPaPg=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSesqNXIl+kdAsZroBdqAwnEFp+uggm7zS+kDKobONBqB5fdR23JECSx+5OtVYoTfO8NE667sJIzgecjqDIdd8=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlZeUZOV5tyjxTCui6Hv2VLgiPWHpFJO7TH4WWYA6cHlO7gyvehWP+NDG6opCIPaPg=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcL1HxHvL7ZCETdz70FGGQmy5RIEp+a8teSHFqr6vx4wVRY1okSfY+eBBG/pMzcCwGuxP7KO2Glx6Re3ktYWLj3U=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w9M8kTybtH21DvisbTh6HRwUclnexkv4QDe/dFELBBlQew+Rmk2uiPOzNSGDDoLtUgHb5dq9yVyiCm7pOe5bu3CHpTz9shH7fEVnGDR8/ULZ4arv1m30TPZTvksHEuhd/fMf9MrafbvJ5eFOUhLNoHp</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2GXVEW4+Qr3bPaP2H2ciTj77TVegm5mUz62UvScek8mbeL7y7s+/DrPZW7aF6QKY7XDKWGKTnXRvVrGHH58uV6wFdHrgKmRdWPGBArrl6GILFixgpoaS4BZNRUYMSyLdQZ7pecQ/GXhYdnZCk0NMxoLl/PEUKCZPYqs/fJnRVAWWwMMCUFt3Eyrc04Z222Rc0DNpSb82UjdvciB0vF64I3h8imv2uQ+6PbpLOOCJXdObW2cBCVEskQtE/BQAGRY7JH3NRvOR8YHR9XpOS6Ue2K</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsmFQKIuwU5tU7jLG9SrGJqocfbMeuFNlNeOVe7sXIMuurALSNp3pyqVTJNNX1PtAW6JpQlJKaWqA77MVWMj/MD55h/MJaoEhI2HYnh+0TB5Ra7sdFJUc4YKdIQ1t1C63hDQ0eOpuGPb7TgXI34g7YRU</Encrypted>]]>&VoucherLogStatusKeyLookup;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP60FO6w+tWnK79JqFFA13PuTP2mZFXUJHBHPof19QRgt56dzpzk2g5Sl/rKtCSB3YrSWkQuY1j00b7hZO7pY6NQpZbDc451fYHRJjjcxj1KBoWvYyUJ6vd9W3mb9lmI4p9A==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJYgjKSFPtGhu006fXq4lKmwGs8sPiy8qcbP9cqxhmbh4ByusgN6gv9AydN+h4OxgIdOeiGHCywv9gO8bxNS0vk=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPdfH8MKzneOwBC94sjg3Ui+gPr0ojYgIhehyUPjugZe6s=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandRecordHasBeenChanged;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6mTJiZpuAYAKBwWtI8N/7Yt5pHVo2GR1otQbmvfzIgmuyrI3t9x1h/7MW4iUEWLtmWI6ol77F/lIqdodw0WBb6wKcdLDlcMRx/FvPQ1r7OSO+Fgc8z0GCgVDhGLRBlawA=</Encrypted>]]>&VoucherLogStatusKeyLookup;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUP52efV93IC0ELiLbeCvnvOXVCSrrKg6MvuvJFz8/JT27fpRCB7HX9H9P1FSR44OFlbBDZpwfITg4zD/lHegoLmSplDvochgJgJEvqbIPbnNg==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22S5sqB173ck229gHXwzbfiFmK4HWgjYOx8HMNUObs7OqLUuAo0oTaurbqYFgDaeMxk8dvcWzC5WopLqyEV8uTY4CULEfZQnPB4n5Qmx0ytQxdgLiII9PiVp3mdeRQPod+0nP5x9+XRQeOUYOeeQ+OnPLclyDZC1n52pBeACBWzmmTceHWPIAV0t+kstl8Z36ZA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22S5sqB173ck229gHXwzbfiHJJNzc4GcmEVfF3OvbjZm8Kryogk9ourtK8zok/sVsv4rgmqKRtK0OLLazSvT19YlHRX2Yya97MGvpnCkqAz7RLuL3FJamG8syRFwd0I8gy7egOSoQLaujypNlMpG0VRN4l8BaAZcsJ+uJMwK+gOPkX2GdO5NiDt4GDvrOX/gWDOY3GFsz+NZMGDzbxbBAQDA=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCCvUeh8oRF4cKdXZqR1sVirqdbkj/Q6nO3EuI6XhdmuX5wNXZXw8NzBImuppeZjNZ8UFUZAA9CA7GWD9EG/jJcL/oJpyKUJ/6PhnRlgfsBEU1CE35Ec9QwqwtLBPuay6ofGhDZtbVWk42ewQGHzNd/nkpWbTQspTCVJ12Kk3YVh8xU9FB+cS6/a3YXos+eLTA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4Ni5lMon/7qg9i9CiiGIY4pDNBOUrSaprHPgwuNz9SU9Mqpy48rVx+dQwE4Nkvtow==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1dR1iU/AR4DmmvOFpBUbbP9w6s/H8pWNF1vxP7LJhNIKgYPavJPM0cBTLK9Pr/keg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQODQYHJXEiPyWbZ8pkwYtCEFA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkD5ePc82PlKqec+1qiFh1amEHT133NOu1k3TA31FRMd48OOTCntMsX4KnDed78Db6r9IzwaAxrEouGfCf8hIkdCqa2f3AZH4hChWEuVABCl/+2MaYhM3zw4t2SV/wuA8N+M0zWZZAkf0CY+ak3H5mLigPPzlP38RZLn9EdQMJL6gZ+2yG5mVBUi3mit1UdzOHLqqnhFwylE/741bK/ATBnUE93FW4gAs/HD+OqEMt5gpA9TNAc3hwW5Sa852iGU2XcFHkwW8mjVSWNzcc9LZ0PkMh/kILghDShwQMwEQNdyDqX7pbdhD8lttM5rJE8o8Ormu4+0ibQHiy618yZOLI4fnbGaRJD8c8t0bg6gSdXMYFjIYmri7MKnybWUdwafyO+5j899TKq/h32gckzYqHdAld8nZueL0jaSBP3oIkfNrFDKOPgyiTjajB030H2v1hPKKuUtrF4GlqjVBWzqVFLZGYjeM457Cw+92Iz633zp07Kc851si+aKGe8mWL+SspRZdFHKNOoLPNI+oHamO6+JQw0+HIjP3LZHHZElinzTxFeMc1aDusBKYuPHvNHJgEpSoWMEuLeedfnbTNA1b031vrrt6YsLYiXIfnSixZYBtBCE5q9fuzxf52/wAunhout7Zmh9B3RQkhGprVRufVR4/wLbHY/Kl7VZbLyBKfq4rtgHWdcJ8kgE/4BzjOxTr5n4UK3/TMEKG6JDRzNfE6WJ+yY66iwfIxMkKfmMFUs9VfCty6SJLnUn2U1URUWcbMPkFhEA+s0Ir7+/gymmyq6AmkEbe+ZZ2/33SrL/+tujT+9BX/Lw4IOtG5K6DPJF0x8Ny1nlbMWafsqMmagAjNLSICxHPeAfM+yupN+vNFWtyq/d7g8Q3l5Z54zNYawPnxI=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBIuWsgBdWaeRzPUaGA6i9/GE/4kiW0ulacDvsRDfp2MnKRT8DgPmPvI8nzXXsCDQeFOaGCsyhsYT6giy72rRVPF9SOdrr+UJE+YDNVyCIYIIGo1kZU9TDJyPjzx4FdoKPiHOpdEnInZpMXJyUd5Urn0OwK+oMEVDcNndRUpYRUtR8tfUgDNTCz1CvGwRuA0r5uth/u2KT4iNePTFfxk3gmvxSv/I5mI45KjEqPX1fPqF+iYpkX/veR9cdAhehi0wfOuT6xvzU7Z8x3U6AxoyJVfrAD1czeQLAub5bPRGfEcM3YLk0yX0BDORNxWCIV/SI2pHDeCjo/yBW4NZMDs3KnWRX0cdK7XBL1tNAv8zjRr0MgH5bbN4VCIiyknsF7MDPTHDCPbXbaHF7d+vYLq9zZjUGiAFk89nxZ64h7hq++iE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfMqvLqM7F4KfIsNFiMIReB7lC/FwwZFxIeBv3q49MwsDQt3Fg3Au22IqlTWOF6Uiw=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBXBiyo5HKNhq/fAOHfPneBzWrwjs5uKff66fJO0FqBRHJAKDY6MGhqUvmZkxfNONCLgA5T309yAcqeEdu83E+XGVJvahf7Wv15eYYt860rw0ZMNsljIxesqDTTnVMvXoV3G/XnCyGKs6yX2XLa3fFZBDtljCgTclyhz7xBhJOk0Q9VyJYS0WxbXaRIV1k04dw6SzseoPdm6ss/9bqMAsYJYphd5YkKH5qooueKBR6LXg8H6KrTO8wBaSVihKKAkDcn/LdYFw8w5k8fdNt2WokOf</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPk83/zJcLjcgZjrHW27FYo6tL4h/5htHptlXLGf88wHQnhMVDnoUnQOKcEbRlM5HGblSSWFCiT9M96vBg67CwgHKX9leAnDpPqRlJJzSNLldNicPYrYujUD84H7xy2BQg=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/7827Jw01WmvS94v5KOZrSlNX3QRJystYS5HYihh0KIAtT</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezz98bw5vjPkxRHLnfD1LzIZfCruaGBHR3dVF4GFjN7Bkl0tPiIV2pYjbL47Q+jmMRlbOZW/6OPiygHSC5ZG8DJpNypiMDUXrDioejtuwZqhIZ+zg/FfkhZCkzplRreYG7jtoc6dFNP5OASx4G/rlD/LaMNgTNuKjliywjmNnKScTnsk814a/S7ffJTocIyoqHGMRU6jlQ90ywh4fLt+Hv/h07attBk7ewNJaaSwi09vU=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8K1RVCY4SdjgcsgWvnNvRWMjDE7hA/8ie5FicSB1OPX2b112W1p9/uoSLogg7Dmj4G6fy++nk1VdVD1CTB2v8n+5NmtsWhkcdoQqpJnbRiMOLgCj9E6wUWLn6K9smZJVlSZ1Jve1b9qTgoSrhvhprMpFv5fzYpcaMjZYcMoGi0ej3EfZMCnevqIsuKpaQh5htHrKTxPIMUlbij60RdWzE22ebMCCdhP4FtmxZ6t03jClzzZVCEb79ztM4PXiAnLYr+</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmaZxKWHPeASNNF6LyY0DwJk4cvto+jyjnJhfj0DJINdOG+h1NJ5UVXeJIWz1nKI1HFZScVGUYt0gVkIBqDqJm7N1/cMQuewluwf7ubUhCyLbGALQ1JcufVpj7k+yNCihNwCU8PDK61Xi/StXr3ly5pejhRyo0k/mxi3MVqTgT71Triiz5xg+LIdLwbdizCrRz8WFz6tzmoMC/KBWyVwodV0HJpumkvk58A/AiwKCAfxPUZIYRv1NOROfDGO+OMMWok23K6HRRfqQztBNjnxnsojc6jRovSYGYpAWWpaE35hoNaKEY8rHs7nTsOsEazaFnfjb127K2X7ERKcvs3nfa/mJTqdId6U1JTrGPhfBRMGQy3d9Z6YOacWu+yjvsRDp4zT5dd11ZY7ADbquzAU0AQvKP+gMWFq/cpwR1OXXiEdpBShpvE8kB7lhXAGEwkzL8tbB/gAePPdpsqRPUF85pZntWF4iif/50NtMUOLQCftg=</Encrypted>]]>
      &ScriptSuggestion;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &XMLSuggestion;
    &ListTicket;
  </response>
</dir>