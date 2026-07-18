<?xml version="1.0" encoding="utf-8"?>

<dir table="hrehv" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin đào tạo chính quy" e="Regular Education Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_tdhv" allowNulls="false">
      <header v="Cấp đào tạo" e="Education Level"></header>
      <items style="AutoComplete" controller ="hrAcademicStandard" key="status = 1" check="1 = 1" reference="ten_tdhv%l" information="ma_tdhv$hrdmtdhv.ten_tdhv%l" new="Default"/>
    </field>
    <field name="ten_tdhv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="truong_hoc">
      <header v="Trường đào tạo" e="Training Place"/>
    </field>
    <field name="ma_cn">
      <header v="Chuyên ngành" e="Major"/>
      <items style="AutoComplete" controller ="hrEducationMajor" key="status = 1" check="1 = 1" reference="ten_cn%l" information="ma_cn$hrdmcn.ten_cn%l" new="Default"/>
    </field>
    <field name="ten_cn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>

    <field name="mac_dinh_yn" type="Boolean">
      <header v="Bằng cấp chính" e="Major Certificate"/>
      <items style="CheckBox"/>
    </field>

    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Từ ngày" e="From Date"/>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Đến ngày" e="To Date"/>
    </field>
    <field name="ngay_tot_nghiep" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày tốt nghiệp" e="Graduation Date"/>
    </field>
    <field name="loai_tot_nghiep">
      <header v="Xếp loại" e="Rank of Graduation"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110100: [ma_tdhv].Label, [ma_tdhv], [ten_tdhv%l]"/>
      <item value="1100011: [truong_hoc].Label, [truong_hoc], [stt_rec0], [line_nbr]"/>
      <item value="110100: [ma_cn].Label, [ma_cn], [ten_cn%l]"/>

      <item value="11----1: [mac_dinh_yn].Label, [mac_dinh_yn], [stt_rec]"/>

      <item value="110: [ngay_tu].Label, [ngay_tu]"/>
      <item value="110: [ngay_den].Label, [ngay_den]"/>
      <item value="110: [ngay_tot_nghiep].Label, [ngay_tot_nghiep]"/>
      <item value="110: [loai_tot_nghiep].Label, [loai_tot_nghiep]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K50yJ2JTenel3OK43Ed6Y883zLp3EjZTFwR9RtLRVyk7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K50yJ2JTenel3OK43Ed6Y883zLp3EjZTFwR9RtLRVyk7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cl7JzW1j7TvUnanWuD7zLfugpKIo7aHidGPDmcfyE+jHltCqmG5NRo3cXhEs7Gzco2m/TS9rsAomPw1on0tCXy8L+aq7k2MpvF767k+fDypjpNMECQXUs/Qrv4BUw0kSx4AthhaplPEkIwQBU0Vob5JxXv5vzR366U+T3xrQww/sbLOcSOVBJ8KTptwO318AI1ztWKeqyug+ocAatEf0TmZGam6XkQn21+ZrYNpLMOZI=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgZM3do1G6RtqacSp7r1ueBk8yIlkqtarHawSnpYHCB9OA==</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>