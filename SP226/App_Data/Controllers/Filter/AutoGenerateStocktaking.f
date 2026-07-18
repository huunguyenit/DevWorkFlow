<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Counting Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Counting Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Counting Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="(ngay_ct between @d1 and @d2)" check="(ngay_ct between @d1 and @d2)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9YTyzSTS5umH1JHdkMRAko4kJXzowA4dbvnwht0p/u65A==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1)))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1))))"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9YTyzSTS5umH1JHdkMRAko4kJXzowA4dbvnwht0p/u65A==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(ma_dvcs = '{$%c[ma_dvcs]}') and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)) and status = '1'" check="(ma_dvcs = '{$%c[ma_dvcs]}') and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại chênh lệch" e="Type of Variance"></header>
      <footer v="1 - Chênh lệch thiếu, 2 - Chênh lệch thừa" e="1 - Shortage, 2 - Exceeding"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110--: [so_ct].Label, [so_ct]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11100: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEBf/fojOWV/LQYmBYdUUzYJKEXtLK2nNQciAv1To4MmEDjGJRUuab93bH9+8WC9a4E1dBIC2ulBpYzIxUOgn0s=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpgZONKdU1UPWxvzyV+vn9pV8AMouFBAF6ZfFNjB8xB1ohB+NYLwmZGVZnGJWnlC/6DHZevjtxIeIsfB2Nu4gPojvUZOdPJhuGYvFZqdiXk1afhHJMF9iigneHI8q+XN2Ydklp5pHtn0PQqJ90X8AP2bXFOucZncuXD9WxfD1t/m1GBaIDRk3jdr0p/6ctD+ys=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBgqhKM+ogaIyRRtI58CGHEr0YbaFzqttWsI/giyR/w/4eJmhTQzQUnxcxyGbRcdWscFHHN5Qf415wYPq1NJPr0VF/kxWmlGlEwmpC8oe857CIAu96jF50H7RfOl6Y9a7mJ0VqAuQthIiLcjDTRC8jApturTsoWCgpL1rp2j9Un62kEcnf5ovnnSNb4Qhrtg44yhbKGqH0MVvzPKk8FoaRCu2HwxDUWYo3HjTRhDwQ+cmq5m1daJ8l2tC3nZsSz9D40+JZXFghfUiqoso0TF2H/6LreA5b5q7i083o53BuOeutKXJD1N10fq+nXsHJLTFyW9r3NFU1aWZxbH2DLav9zvRYrqjSzHYyMVOoChWK1eb7xB+pmNSi4DpdujXwUiV8WGCMUmcf4ueFT+Y8dXZ3oHnzmy/6QR77N0/etsuHVzr4j8109lh/yWAci5xxe4C83BvViS0Ie4fJKobPu5qILtIT6pVooIljkof5cnQgmqjPgKXXRO9kALuGH4y/5x0IY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwJ555nTlenMgmInATAlcQgKA6xR0794x5UAdUFs97rlIJAn22tIvgu0gor63P2mQLArtHKyPOwgnm/KI1GOJLk6EIHO8KWYhMkKD6JuttsTfeOEHJ70RMXs8h8E0oo1NFDuohCN82RVzctWxwbU+DYVnLa/8WT/+MlZcVwR+fQP0kkKEptsWcdM82JLmkocu9QXKTVxp0phRXPd2ZDyd4NCC+ZE4S68h11UXmicQN0Kk1OOjZkQ8IUpnptdZKMUPmWJckU9oyjpYBGwCNE748wxvunJLA7bC1X8wm5uICZ6S6+iPf2KaR02zTVia8k78jGGjBAfUoUxkD7p9jtO+v8GOuZSKoYuwGtvrOcC/zrc69vjq/4uA2GSGyiVWpeQ0MupLfZTD4lKzFOKEuBagcvLGQwOE8E4XXc6KH+Qf2Rc8c6iAHwx6P+6KTz/4fjMwNTWw+vX+zICAyCvrsG6IcTlyzV9ys6WUneFADx51zCnZPxaezf6W4Q7XbKX+o//1J+xlgfdfpynExV9LBUUmdv34VEsBm8bK5tiZyOd+wBQ61BrBRlnqt6WzikNMs3CkP6KDyHJwe/TKm0wtl4b5E+lSxldfBK/+s6MYKyw8yI20jR9XYiyWp6tazzNn4/vkJGGulAXOVzagvXmC78ikXBU3U2Rzld2XiJxwVD0IL/GdNZuig2qEnqUc1ycDe0c1Q5F39XVAEUhge2ShEi7X7gvw2dTA+GKu0HnrQIVKtIwg==</Encrypted>]]>
    </text>
  </script>
</dir>