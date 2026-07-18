<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmltdbh" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại thay đổi BHXH" e="SI Change Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Type"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_td" allowNulls="false">
      <header v="Kiểu thay đổi" e="Kind"></header>
      <items style="AutoComplete" controller ="hrSIChangeKind" key="status = 1" check="1 = 1" reference="ten_kieu%l" information="ma_kieu$hrdmktdbh.ten_kieu%l"></items>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tinh_chat" allowNulls="false">
      <header v="Tính chất" e="Category"></header>
      <items style="AutoComplete" controller ="hrSIChangeTypeCategory" key="status = 1" check="1 = 1" reference="ten_tc%l" information="ma_tc$hrdmtcltdbh.ten_tc%l"></items>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="moi_yn" type="Boolean">
      <header v="Thêm mới trong quá trình" e="Open SI History Record"></header>
      <items style="CheckBox"/>
    </field>
    <field name="ket_thuc_yn" type="Boolean">
      <header v="Kết thúc trong quá trình" e="Closed SI History"></header>
      <items style="CheckBox"/>
    </field>
    <field name="stt_in">
      <header v="Thứ tự khi in" e="Order When Print"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280, 0"/>
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="110000: [ten_loai].Label, [ten_loai]"/>
      <item value="110000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="110010: [loai_td].Label, [loai_td], [ten_kieu%l]"/>
      <item value="110010: [tinh_chat].Label, [tinh_chat], [ten_tc%l]"/>
      <item value="-11000: [moi_yn], [moi_yn].Label"/>
      <item value="-11000: [ket_thuc_yn], [ket_thuc_yn].Label"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="1100: [stt_in].Label, [stt_in]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfno/MDDsXN+bTXKMIlA9c4Js1EGqciqjhFMEErSotnVGJZy5KkUbAqEZGmmcXy9yEn4W8d5uIXJSJnRe7+PsWa</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaUd4wEBYI9nl4ZxD3Pv1JZgCNfHi8d1/2twLlVKCnjXJNGFvsGOCu36/LCepxdszw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulitBK3ezEyT+gb+riBolOrDannoifrmxxRy1yDferwVmTaV8+swE8Pdknl1t7y/INznrtue/hJ4tFxce9e8xC1LjlhwJLyDP/Ko1a+hfg6O8mkmOF9HRYwvxe/l8fqffM57ayPuKAD0e2aUH4M8SPdpVsu6ckBl16Znc7Ii6DTPCUx8d9Pj2+M7DRX4TmhZG91ZczSniI/X5DxAuGmHozRPL7pWpKEg6d34m+Qkmw+NY9dibZ7mobsMRWoTZ/LZIVoPTC0oUvIyw5l4rSJfMS6XhofDUXcfTXOMuGhqp9KnacoLDUqs68qK7nw00I3vglHgtsld/M/TYg9lgFKpU3URrDRhAdT1Xg2Fe5kapCPxn4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG4AV3lAjj6aktUyOOORFsKjr3V5Tvrpn7dpX31kBOkJ0leZWIS0vml7EY8pn7mH0VHqBTivPQ6spiCFViZAeWH0vy/xwzAl/81Ol6q+/O5V4VNgJeTLG9ZRawaO038jonDQ/r6HYI8+Vt/v8Z3r1fzBf8uKDUw+6CtzBVTwy2L+8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEl0Yzku2qKKv/3tCgy/05sK5+PunNJoVkI34S5PexdpUuHK7S4ZnExLVOrk1OSVp4AN58qr6K8myDKC3kyJ7bncU/rEK17E22hztPPat3EadbktgvXLx0xHAsLvuAdQU4ZHeZYZLsuJYKY2szp3lS8oKP6GipGIYnKjODlkUnHM4jaUdcg3H7yYN15SWNKP8KKDiXbFMXrBB6e7t7KWDtF</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkY/YENNskWYpI1ISfIwGDcgRb7hik+HTxSkndV+MFnWtxKCzUzeD0qwrYYTNDYqZFfLsJRYV02RyIxF/ZRkJuAPW43W5yhT2zhleySW43Hq2VhLmMM3O/ntPGn2JhuTlS0/Bgq9alkDg/dnm54nBUOXed7Gg7S62vH/FfFRK9gMhdAw5nWdcYxeYFpuZVRuAWdSzkfXRa2xlBS89LTB4VGMdPPZSoa4z89nsPMKT+4xcUjkbZ03sn2CKBvjy0VX2dxN+Zk/hIqbQ55pcpe/xUOv1Z7KnT30T2IpaR8FCRIPCWz3AxhcNk8AKi7qAl5ExiPJv3ydb4caN2YP2D8S01XS</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>