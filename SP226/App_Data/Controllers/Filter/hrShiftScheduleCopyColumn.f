<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép theo ngày" e="Copy By Date"></title>

  <fields>
    <field name="ngay" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Ngày sao chép" e="Source Day"/>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv2">
      <header v="Sao chép từ nhân viên" e="Source Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv2" key="(@@admin = 1 or (bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_nv2" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay2">
      <header v="Sao chép cho các ngày" e="Target Days"></header>
    </field>
    <field name="ma_bp2" allowNulls="false">
      <header v="Sao chép cho bộ phận" e="Target Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp2%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I9uB4+Nhkf3VOM/lkG7FE0kYHIcBH3qKXmo2zI8VYP+/L5zUem/DuH8HtPw3Ol43Xp90WCl++N6f3bxn6LEv+I=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv3">
      <header v="Danh sách nhân viên" e="Employee List"></header>
      <items style="Lookup" controller="hrEmployee" key="bp_ref like case when '{$%c[bp_ref2]}' &lt;&gt; '' then '{$%c[bp_ref2]}%' else '''' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref2]}' &lt;&gt; '' then '{$%c[bp_ref2]}%' else '''' end"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="thang" type="Decimal" dataFormatString="#0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref2" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0"/>
      <item value="1101111: [ngay].Label, [ngay], [thang], [nam], [ma_bp], [bp_ref]"/>
      <item value="1100101: [ma_nv2].Label, [ma_nv2], [ten_nv2], [ma_nv]"/>
      <item value="1100011: [ngay2].Label, [ngay2], [ma_vtr], [bac_ql]"/>
      <item value="110010: [ma_bp2].Label, [ma_bp2], [ten_bp2%l]"/>
      <item value="1100001: [ma_nv3].Label, [ma_nv3], [bp_ref2]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUMGaUb9sqzhcvJsBEUvrg1WYmizp/pfWzwaCv4PwXAzbfktGOLbrR853MBQafNNWKZUYjF49prdP5UvkN5IjPVbkNK+/K7+VE+cJQfMR/C</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMt1oHfmSZ/Mwp4FHr/BqIwpgQuQ9ZpzuIW6I1na8k+QavJ/riT2R/8xrdXsH+ILPE4R3RwslhsstpcMKHyhaJPvYFkfMPw/4h1Nyz60LIwU</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNiuSnMegA1BDlKHMs8co2NDsx9bwcAIjO6XuBHo0OzvXGnDz/xAOK02KF3UaO7O+qoqpQQsaRq/UpgcwrTrPgEpi9zhFlBkThaEyQG71kkgnZZEh/bEDm/gxzWv043OrpWw5LD6gAaXSl6iOhSZot/SI4IYLi4QV2WWYC+F3Qr</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ESp05za1KZD7FA4JFeI2aMPl6nL7HEl1WOeYV5h1eRVCMGll2yNP1y73osTL55RFsqzaRsxImoPBf+RzWziQcgXbP//2I90cQwGew1Cjdpj2XcjLLyEnya2F3P39BNwopW0kMRQAwOcKSP2Se6R9aQ0ruVM1buaCy9Z2vkgMCZHqELKGsx7K2I7rydzmUsVrpfxKaAOO+ucZAWFltuz9d6k8srKJIUSOtLJI1SGtLTEGy7MON0CjC6Chc7wY6n67Orfpcto/z2ufi5m2HjYuWPLNuL8iNZixLhiiwpBClSnDTc9lUNKtJccVs8QoQx1z9htULILyGEE9TUzhh6g88HhuY2iQnMGNa1wMbMIucx8+ZahC0bKXyyc7xlmhWlAdrm2NWRr+95Cp/CkIbaybarMJ4xLPGKff+0HHjWPlbrr3yXH76wsKiTmU1HovcBoZwl9t/vXQlWes3B+HziULboECDtMR/H4ME3TDJl42IIooDq/OTrOn3NtgbPzp5jrhsuizWLFjQJQsMfXU//Q0aazC4LtxYxWfkUNsLxiocjovC4FiTTWgA8c7hOMoGSEzyeYozoTtVOsHVIaX2zWwGRhLl3tmzDRE6aNvBlrMslNpsUQKB0c5N9c+K0ihMTPBXEtyEEWotvnED8WHUn/2+XAGKHS1NmZVDwQXa6STUJ/4DZ9f2o0jbyG/edcF3W4uQg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZ4U1jXLSDdXIUZ789fJPaQJ1j729qzhqogNjqjrBRv+OMD03/+Tzkbcq+4r6gK/l8xqr7iHvB1Q65aKWwTgW/p1WZCHbd4U4+ILlsLyHi0VIvNrrwPAZInN1ANrUnfEtUSFvDoc3qRHwPpDmVgj8NV1BLZ85vWHJfEMzvPkoM8ASajbJgL6zG68Wy5rwY0iPMHTLZnPtD6JpgPJqxslh3hL+vQd76HN2D9ACUqgk+A9B6J7G2T/Vw7IUsubEE5QxkuPzlaA07jRs0xzVAb2UgW+5vB7YLdQQkEVZ5987tvQo2b5ZF5apF6anRPbeHW9KLtjf0xelsfrd1LrrF+1gPmU7m+vBmFtUGkhth7B0B07VGu27j6gn2YYZrFV5827m9tzo8qOv8cRraOfYEetZKjOZoCF4ObGOeNhhkDVQJqGeqjX9zVORU4ycUjH0aF+/YRMKTfAC/WGxnocHuyMWwQkAA9w2HOOJfBNcbQ0n4hMyBH2PyIh1xhhSbBTzqp/vaEILmgvePdxGDcrfBUyGc5eBnc4W/bbtBlY60dSxKpXzzihThx61b2e0UssEcYaB6QnvYpzHyuXUgcl0TPXxYU=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNX3DKas7BI64B2LRp1VJOARoAZuWnTSKjK6ZADNk39h7HTzNiwidGjIdhXsb2Qgt6PVLzN/Pj4zjcge+JV5MdQg</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>