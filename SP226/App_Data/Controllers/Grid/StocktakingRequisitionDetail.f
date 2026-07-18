<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="kkycct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    
    <field name="ma_kho" allowNulls="false" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên kho" e="Description"></header>
    </field>
    
    <field name="ton_yn" type="Boolean" width="60" clientDefault="Default" defaultValue="1">
      <header v="Vật tư còn tồn" e="Availability Item"></header>
    </field>
    
    <field name="vi_tri_yn" type="Boolean" width="60">
      <header v="Theo vị trí" e="Location"></header>
    </field>
    <field name="lo_yn" type="Boolean" width="60">
      <header v="Theo lô" e="Lot"></header>
    </field>
    
    <field name="loai_vt" width="100" aliasName="a">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>
    
    <field name="nh_vt1" width="100" aliasName="a">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2" width="100" aliasName="a">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3" width="100" aliasName="a">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      
      <field name="ton_yn"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      
      <field name="loai_vt"/>
      <field name="ten_loai_vt%l"/>
      <field name="nh_vt1"/>
      <field name="ten_nh_vt1%l"/>
      <field name="nh_vt2"/>
      <field name="ten_nh_vt2%l"/>
      <field name="nh_vt3"/>
      <field name="ten_nh_vt3%l"/>
      
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiIrunk537LtbtduwQJIgVb7ahDVgPsRO97Ql5OHsKJUt5CQIweHuvZUhoqX3IrfIN+X0gR+HApAEXwRsWjagKuRlVsHrPpsH41Fq9rF8vYv5</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiATxjmWnGmZ7sRwg0+6hZM6Gy8tqvysmH+Bvc5nk6gN2Cz62iHIJ3ijy/6GrLDYi+MPlCiPW7d5gUybw2s4Tf54G2Q8NUR/+WTNp8qGsvcNB</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiHvAQkqBPwC5EfviPcaVBVX6jdODDu4x5WFCsxldTwwnIrSR/PmxX+ys0ZDuMDi7mFnNVlZgxHoU0aEwqrCWOPxEC+2LXk/9rj9LerlNgwoV</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hkJds3Eh+TCmm/mr0xVYHtean8uOVG9J3vsBHnIkBEPQZuLTPYbh90jOS+sAjpuUeOtxJNh9R55Ka3yWqCl9s6MzAtNTn8hoQ6jZiQyZR+J8ojkQ/puOoVeoJlb6nqTIPwD6n/Zy7XHrQi/JS3iNaucIqlR3tlNrILexluUExDT0IA41TZS6JJiiTG5hjdfukn1sKiUmUPYRCaKMjOxt0Sa1SyqMCCQZJrNYMxn0UVSCPOit/oHlsa+PLES3+NwhRZKrwIHH+xQmlwWAQneKR+U6AuIoLBDlSzak6ljU3sBvBmwr911jKMuO5uWOhXE+9Z7zKUs1iqTgTijOB8+Jy0d6/UugY7I/VQsvg9OMffjy+gx/jgEr1yrd64vtj7n5oCCdIJ/J5djhD4SXjkCejaBYNQe2duw3FEpAMhX4yy14gKByDps242OJ5XJClOEOEj0ysjyPTZ4SXnI2tZXAxxQpWH3DrdnHK4h3wM5uGXLaA==</encrypted>]]>
    </text>
  </script>


  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoS0KXcExNhLM+s3fk22C0aWguHL4E0TuTrRCUZJ+JH6l0MM7cTe1J5WxTyzuZ5xarfk2K21x+0tX1lQnq8DmQV27SXQC8+Vl1FHsICjRXPNJ3/8IrPjaIWayympHl+G2FNc7Uz+9WXJjthKyrLN10FVNOmsft2SPn3G0nRrSwb67X/G0c/sp+MhQgi7hXzMXbiMb0iLSeDSV/IlmQSEcQKhFBIzFqjb8Pv4a7maajxJA==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>