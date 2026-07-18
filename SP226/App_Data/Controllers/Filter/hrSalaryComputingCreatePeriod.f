<?xml version="1.0" encoding="utf-8"?>

<dir table="hrky" code="ky, nam" order="nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo kỳ theo tháng" e="Create Period"></title>

  <fields>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="del" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xóa năm hiện tại" e="Clear before copy"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ky" type="Decimal" dataFormatString="#0" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0, 0, 0"/>
      <item value="110010000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11100011-: [del].Label, [del], [del].Description, [ky], [nam]"/>
      <item value="111000000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+zYgXkWUL4wyG2/0lrZA5vN7IRsLr0MG3x7aaLpxjhRZgfjigeq2AID0gGk6QZBjLekodetMkI4Z5OhPj5vm2angc+L/Ir0/Ad9almi9IfL</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UGtOyAeFNu+jK9xbBU/JeD3O2fuRrH7G470Q6/gCQM28/Yt9w5cxxa3VFdFStxpPB6lwHoLkv0npRMxHfem7QOVLiHqKFL3INcPGgJkkazOjYd4iAPxr1WB7qqZYXbRlpjDvGLhCoAB+yRiARFq6A9gxzipnG7d/th2xE2ut2XHFCbaDLQtheXmdIZJ1Tkk4x9eEA8vGSMe17OIQGq28u5W99S5DGjVQYz/h58UXnIjZzgjsfZ23TwEXgbcn5RUxpldJKo8eAXv5IKIyJ7jKriQL292TmTUW9bbH+Xz2JPOI8iXheY5BKDGMHgl93qlftSZgX6bG9lAyekkkGi2pPp9j6nFt2ASmE5YZcH/0fkcq0wPNVMNctBP1R5xNE1MEUFKVSs1V983TQOvBweMaaOj8OY6uqFvSB/h6aUOkBquRL+xKm0ni/fTbxyhKAqs9O5avV0BKGDjLvmLc25s/v0+0jd3l6IGOgTSLVc3sO3PxZzgTzMMIJLK9okWts40dUz/sX1NAskZHeEGLJ8alQHp3RI6tejy/6MegQkvKP0I</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>