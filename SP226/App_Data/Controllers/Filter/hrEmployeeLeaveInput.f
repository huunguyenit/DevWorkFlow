<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrnghi" code="stt_rec, ngay_tu" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+qBtTtKcMGUXHMVvGKiGfHDus9LeuMkAP3LAGD9RhF1HU+LbuQxZEu20oSJUk3SAGYeYzLklrdgwfXKNJAWmg=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101-11: [ngay1].Description, [ngay1], [ngay2], [stt_rec], [bp_ref]"/>
      <item value="1101000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPjhEzai8T7X2+pXUtYHCLtRHL7mRn7ma1CRucmykPSWXJjjZC5qYWeYtfg+syX15dnBNW98nNd3ELuEn4EFHDleXuFnbVKMRW+2wmuyKNszL9BG/KsEmOlQtMlWIp9ma9YUDVYzS9xJuMyTRKAAwgWowFzfcw7+6FMJqYLB7KYuWVg8DEB/J/UJVfAKfvJEblG57Y8nY4bFNM+XrLDOPbOgR7MXtykYswOAi5tp+amznCLqe9MPuCVXoxu0fN9b250PeASgBqnw3WxF/LtPWiqjuYO1WvRN3cFS+uIU529UgsdglFQYea5HoOIhx1+zhqKd8emn7iUYRwBrrNnf0niWPmi56EvAd/GfmYGqRGUJ07HZ8rt6gGu8q+eC9hXv0q8HHUE8FFJ4p0RPrJAXoNxK2v70edopHQR4Cu6V1+36NJ+7WJ6NJBOMb/FIsKya6gcQHdvN1lJQRNMCtFKias+tU59O93vJ6zeaXxfFXta/r2/CFwILSexRkIRk5SjvQwH5cGoL6yBNZEvLL9/wzOn8EOg5X6keFFi8HoqwtLPku1L7l6ZXpHuU/vo3Ai3noBGjVzx0vDAnVKyWDafoLSjZYY0IYozmkUWD5PjCiMPcBDhkbbzDO6pBC/s5sdbeHaqO2r64SJoMikaZRb5hrRDQ==</Encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4OhCFRfCy1GRSSaAdSJi+ceXeiUtDOkHC7oLGMa2dG0S4RhzgwKSz9LO3C0VSw69qdy1m82VaIbEgg4TC219LIfetYUFVdTP/RI6CyVnDZ7A==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>