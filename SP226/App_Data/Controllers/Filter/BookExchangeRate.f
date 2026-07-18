<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tỷ giá ghi sổ" e="Book Exchange Rate"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_edit = 1 or r_del = 1)) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_edit = 1 or r_del = 1))"/>
    </field>
    <field name="kieu_tinh" type="Decimal" clientDefault="0">
      <header v="Kiểu tính tỷ giá ghi sổ" e="Calculation Type"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tính tỷ giá ghi sổ trung bình tháng" e="Calculate Booked Exchange Rate"/>
        </item>
        <item value="1">
          <text v="Áp tỷ giá ghi sổ trung bình tháng" e="Update Booked Exchange Rate"/>
        </item>
        <item value="2">
          <text v="Xóa tỷ giá ghi sổ trung bình tháng" e="Delete Booked Exchange Rate Transaction"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZS5rsqlmTLI/WR9x0huglFe22ije5NaPZnUguZym50huQLxEhpux/Dq3rNPKgLP+KG6P6M2bNVyZcqMe2OwlUYzvIp9W2w0dZBN0Nx5iEDGx5B3BOxULNch3RJHCxT44Q==</encrypted>]]></clientScript>
    </field>
    <field name="altg_yn" type="Boolean" inactivate="true">
      <header v="Áp lại tỷ giá ghi sổ" e="Update Booked Exchange Rate Again"></header>
      <items style="Numeric"/>
    </field>
    <field name="tao_cl" type="Boolean" inactivate="true">
      <header v="Tạo bút toán chênh lệch" e="Generate Rounding Difference"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 15, 60, 100, 100, 130"/>
      <item value="110: [ky].Label, [ky]"/>
      <item value="110: [nam].Label, [nam]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [kieu_tinh].Label, [kieu_tinh]"/>
      <item value="-1-1000: [altg_yn], [altg_yn].Label"/>
      <item value="-1-1000: [tao_cl], [tao_cl].Label"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3ka2K0ccQdJMd66IDfrDxfk/kEBay5VORhNCllsAYgVaO7WeXIvlAfuJrPEi8nGss21rWY30O5cHFhg1zoQk2c483KJlIsjMyFRgR0TnALFtZ6i5A7eX56zh9WYPldpWtDB8HUiCjw6SwJke21MR6kEazuAE0+Nur8qIdiob5rldGuiXQ17NFt7sQcZSHVgdZ3HrHCCQyYPYc9IKqXlRDw9Lr4iy3IyoOIJlrYJhcSuueUO46vcRqkeFjxVbFHgZw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY+RhdrwxK2rcCeE87f+zOFBGncHQDXgQKk91Z1eW9tzerOusxo99Wx250N5TF4YodxSMAD1gKfsBRw1fRWV2KqIASzfZMS2GH1tt8CjZHaqBN57jcIYYRVaOkVo7rD2j9nvQ+qfeQtS4bLckwUWrBaFx4b8l1y5ros+knksbvZou6mkmVqtSQLYX7u9wOt3dT93Onj5vGD5RtDpEb+Ob4oQjoDrb7vURghTJzdvCm7DBRkC+ddnNk4u4gOdps/UNA</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>