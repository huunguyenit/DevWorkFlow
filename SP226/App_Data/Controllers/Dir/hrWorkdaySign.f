<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmcong" code="ma_cong" order="ma_cong" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ký hiệu chấm công" e="Timekeeping Sign"></title>
  <fields>
    <field name="ma_cong" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã công" e="Sign"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cong" allowNulls="false">
      <header v="Tên công" e="Description"></header>
    </field>
    <field name="ten_cong2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_nh" clientDefault="Default">
      <header v="Nhóm công" e="Workday Group"></header>
      <items style="AutoComplete" controller="hrWorkdayGroup" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$hrdmnhcong.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai" clientDefault="Default" allowNulls="false">
      <header v="Loại công" e="Workday Type"></header>
      <items style="AutoComplete" controller="hrWorkdayType" reference="ten_loai%l" key="status = '1'" check="1 = 1" information="ma_loai$hrdmloaicong.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="loai_luong" dataFormatString="1, 2, 3, 9" clientDefault="1" align="right">
      <header v="Loại lương" e="Salary Category"></header>
      <footer v="1 - Thời gian, 2 - Sản phẩm, 3 - Khoán, 9 - Khác" e="1 - By Time, 2 - Product, 3 - Piece Rate, 9 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="kieu_cong" dataFormatString="1, 2, 9" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Làm việc ban ngày, 2 - Ban đêm, 9 - Khác" e="1 - Regular, 2 - Night work, 9 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="###0.00">
      <header v="Hệ số công" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_cong].Label, [ma_cong]"/>
      <item value="11000: [ten_cong].Label, [ten_cong]"/>
      <item value="11000: [ten_cong2].Label, [ten_cong2]"/>
      <item value="11001: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="11001: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11100: [loai_luong].Label, [loai_luong], [loai_luong].Description"/>
      <item value="11100: [kieu_cong].Label, [kieu_cong], [kieu_cong].Description"/>
      <item value="1100: [he_so].Label, [he_so]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx8Nq8HuhJdjEH1NUAs5AgW//bnZRlvyNJf9YSZ1X+gvjr/PpzLzANd0RLcqYF0Ut0SkAqDSPrL3NiEtVcUNmEM=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8vJtHy7MqOAGFFnyKAAnqBHMMlWSIUhXODI3k3XoNHMzcC6EBZlMKzywNOxQVDE2SajHaWPx4/xxpb4PkkNoyY=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulilE6kHZcxy5A/aMQE6CIj+39pAEecicgjGEYk71aHCTi+VqI4AJhO5eViZkjcnp8OsaWWMHcW9Q5UwMGjLBeLNvMb2sHZYTFGQv3+wkndfb6FZVUF+3GVZgtNPHwrkWUks4A43DyiKp37sJdmEJ2F8FfYuW1US5KgzEUXonLRF6Grj9+OqvG24FKCAl1cAX0QR/+tKoHUcZ3l5EdiXZskxK1dEzj5TDWHhfLEjkbG6AjCwyOGFDmc69Ci41VChpM+jvJRoLHB0iDBGhTHvK8fLZNRvMRRfEC5NzwgPVUTSwr4cPx+VXwLmWhUY5TSNT95HIYjSLskpX9e0HA8mi6PdhkPA32pMcNzEW4mxUBdqqo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ntIdctUZoH5chz/pjUUOi9q5kMtsy6BtFsJl8gu4pANs3U2QzcYUQT8OAaV6QW0MJyudbNCNxESTLNQqw/SVrgrt8UMVJnlip4ovRlLOo93JecJfj/oI8w8qVPY/cYR+mDNayeVeCJXXOrv5dctoPYDonsHVUFaKC8bjP6bvZGeb7ZPy4Sacnlvx4SmalahaCbiJSpVWkeCAKXHF4Ef5hrHhMciTuEKEhZkAtTSlugQQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jGeIZkcbiEFnKPXtRqMqmLrzbNvvnGMcjogMqoVYwHo74Mh/aMe4HovU7h3dmhkjCd76rdYUUTNe/W/ZAQfoPlorFUe2irqvT7Ovw824w/FKkSQhlk0ipTGCgD7J0UZH93ScrV2TgblL69X7JTTY/IbDLG/e5jZ8CQKxsvTHjYj9FeLQIJ0QZ84CNTr8Amzl3Kleq5lU95v6oSsspf8IjVRoXMfaL6fiLDJvjWwN/8F0ZR0HEBWcen0dJZHe4dPtH/sePgEh4djnKNMguaBgSEg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbejbaN5WMIBSf2iTavUQerLHbZxeq8q3JPGbJ93DD44pO</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KbU7GvH784Li6EOQWp3AE02gZEgFgpm9x7MdZNKDODcAlpDaruZ5VY1+uf9tuM4ZbQOz6gt7vvXZ5sdf3g9KTJJF4gWpGTR96kRUHwIvYJyunQrxd8oH0iy2KjH/1R5m/ptxSgCWNE78pQD/ki9zFHA7PcjCH32sTgDg23v0Swwh0Y82P//Eg0r2l1D2CQd5vyHyU8BY0sg24METOy9dkOrtPgjUBQufC8w4deAwa53oUWiY2R+ghpOCS58R61qHkuVXeVzHP1Kaf53cyCSgSOl0mtpd2SFosv5kZDKZiRHwsLCtjs02cerjhCIaRqBz7Df7Y23J0qINRyQCpf2h0JgsWV4tR5cLs6Td8telVQb</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>