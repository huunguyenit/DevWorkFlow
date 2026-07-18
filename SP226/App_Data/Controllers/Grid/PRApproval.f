<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY MessageID "PurchaseRequisition">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PR2" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt phiếu nhu cầu" e="PR Approval"></title>
  <subTitle v="Duyệt phiếu nhu cầu: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c91$000000" prime="m91$" inquiry="i91$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="80" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="duyet_het" width="80" type ="Int32" hidden="true" readOnly="true" defaultValue ="cast (0 as int)" external="true">
      <header v="" e=""></header>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="duyet" width="80" readOnly="true" external ="true" defaultValue="rtrim(t_duyet)+ '/' + rtrim(t_dong)">
      <header v="Duyệt" e="Approved"></header>
    </field>
    <field name="huy" width="80" readOnly="true" external="true" defaultValue="(rtrim(t_huy) + '/' + rtrim(t_dong))">
      <header v="Hủy" e="Cancelled"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dept_id" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên bộ phận" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_md" width="60" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mức độ" e="Priority"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="xtag" width="0" aliasName="a" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xtag2" width="0" aliasName="a" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="status" width="0" aliasName="a" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="t_duyet" aliasName="a" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="t_huy" aliasName="a" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="t_dong" aliasName="a" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="duyet_het"/>
      <field name="&Tag;"/>
      <field name="duyet"/>
      <field name="huy"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="dept_id"/>
      <field name="ten_bp%l"/>
      <field name="ma_md"/>
      <field name="t_tien_nt"/>
      <field name="ma_nt"/>
      <field name="xtag"/>
      <field name="xtag2"/>
      <field name="status"/>
      <field name="t_duyet"/>
      <field name="t_huy"/>
      <field name="t_dong"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTP/qkq6dAGFCzARriZUMLD1Ln7C9y/aVC7T92ft+mwl+/ZvjXynMbmsYmw8OHY/+k</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/fKTvKAG++e01chWz0337xqNCY3RMvW4QCh7VYk06/0R117YpEHIpWMrBnCL13oJg3yROYyQvZRiSZqWPiE/Ag=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75z3dBKQcZmFsCmTk0Pj73x5uO3/1T0u8Yq5TLa4tOZl0KKM4LDfXm3zaywgwyrgXbyIkDZ1HVWdeV9X0BdDa59A=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VuNDwsSoJPLsWGhk8SbG0l7/PfwWDfiunfxExa530NXSnqlcE4faMWPe/Kv8pk9B7EWX+Fzw/hLXMwZkL389zgJTvB2P1x/zfSZu5zzTfkRw1hajC14Fq038HRl3AYdWgMNT+T4AlbVDJ7guZLBEAw=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ4j2stgvIVVH8eyMVYSuAYZIo1unHaa7Dle6rjkuoGIzP8O3vwxBqupgcTIsX4UM0XOBZE30sgpaHjmLMuGUd/Yye2TUmpZZGfRyAaqlhtdl8Ar1QIMb6/tjs2Zn135RqZIGVWa9GXWSCzHebUFmJSHssA8Kmy1yEsxwy89FlV2ZAqKoyClRZhyZoGpHkk0/CjWZqU+VTqaZ0INF5+dbnNuDDJM1xvvAOhOCD5SrPG5m/J94Pz1BtM6T5vVHQeSunNvY9XIhC3txGWGtFICNVMVWogmyoovbvkCX9eLSqtVfEO9KeC+W2lQYZuYMqoB7LCA/YxE6RDktpI1OXjmWdp/ZpzMPnO4o4TyMeTrmRf0t0uxTHhkhLY4cLsdj17C6Ne0TzI0NtaFR03zsJtGj33KWyNZNb8KmyT44dXjRlFt1QQ8heVPgFkfdawr7oZqSsVuUJ/IrSmwDpJoTlq7nqlPcAas1LVHcAk340kJkNSXDFDjWPbxlRSAP31Dvns0p74v1qXbRhaa/skeTszV6glGVczBFBDvFrwibC82lp5NFgMvVn09Dtu6Z7QYL3u0ipyTn10DyWtCiGxfLg40S89CghQNUjXzR8QiASoF4yZuYmA5fYKSFMY4HwEK8Ql9/6K0BbbNZscdd1lsEvdz/nDimzI+AKIZYJ1kLQyBofBb8QBz3bsMPq5R6V9TZOORNwncVx4O4I/HfYeDtBaNm6vRohiNqusV2VQ6gx6ZmCub3ozHKSKsmnRQJWtEBH242EkKGDORBIzxPMzdn28sAyjHCYtYJ5R93/41kfSrGnldJGXa1ioPQMGbkTXoqepp2cLYC1ca4jo/HKkCEH+BR/87s+/sYfHBy77qnjOnFRDnpGo7arvVPbDof0YSuwU/88XpoiNdxRdEoOVDsuAeAzUWaFbs0J6fx8hLbLgZoU5LO2hh/Fo2yYmUECrM/iDeOfyJet9g8nbD0T0numfJquNUBSSFa41MsG1y82GZ12yAQkSBE2lzvyQcFPYiWTEZWicOrUSuxY6LgWplAhP1luE2NAJEjspFIJN54lvCbuH4Z7eBcj+tq8JkH9P1Y4qIf4IRFy8Z296z9ezLB30UlPk9gsTMJEzwA460fBV6gyxfBoN4bSL338qDr9NrHc+IKul8SVO5QT3F9mtaDPea+5zKGpYjKX3jMxgJaOPI4tPY</Encrypted>]]>&MessageID;<![CDATA[<Encrypted>&Q0XrQJah1jfacWoNqJYOE8jSjCTYo+oBkTtDsMp3pZpVhl9Mmz6m6nTURGszBWnrKnWpIY6EG0/BB5GFZd5SE96DDZh8o05/y3CA/7O733MiViBotWa2II6WoAttdtOiUT+jwxSav1Gg3gm9NnIdiYZkrwrbE8eNckXqj0dRgUNcUMugrRH8Z1j9BExLrPGnyEatskJ6TnkB6uc1LJfHkJtjJCWjJisUdvW3uS1XEY48NiDHid91BI4zPSb9aQJVd2dDsuu0W7QacBUD7gUtWsuu+M3tv+yzbzBv4SZZ/lYkA6jiAWNfVKhp+XeuMpeMvJPxbv8wG3NiWOp92WKaToa9Z8bBnLaw0es2aIJHQlca/HWe+lEZ0rFkxhKdRdBZE8SXra23HPBuim0aInafT6KrjLID2GZjsiZhXTpWo4lo19oCzh0PZrKanyZrI0lPr3pNgHzKupVL7/qpnDnVW+sFKjdvPXXWq20WQSqXYqimen4WpYj5/Pbq1kXSrCoLxtjxdaDeTqnB577HTJ+lOwlD8FWdqjh4aTIZzqgCCvzPKZEgAXoqQUoCqDxKxreVxCIom37VvciEcoeh5O45Qbbaftkk/EpMstlfrO/MSXR2VrFfmS7JUOYTRpDIjqWrR9P6/A+7YXKbAzCkjVjDInI/moK+PtkYHBKxz5jC0yS5QDFwwcrHfrIHkIKhhS9HK3CDFJaVysu7R61wp/H3LFosL6F5qMvfnDBTozrFdWvGlD/Zfi5/uhIHdJruujOHQ9L3Wi2+kLhn8KUkXfFubfHKrJ+qv9Nh96hyNBmrP3zHLZtpUzGpACdQBhzmodSn6eY6JJSt825O0jOfmxAWnrTxDX1AEk45KK1lSxQ5VhZ4IWiB230dNi9HAnCyOf7hovlCGksd7NiAU4I2O7Dn2APCuLuObD/zYNzCaCT904kNutbWpY4FBe6134n93N5CcbWIiohpYX8g5/LZW0MyxYOTSiN8BSkDC5jPHUEOKGfmFNlEI9BXGi4ClixO84a4a32mJTH7v7yUFJU25UMF6SAOYr58IlusBC9q6d+H4hrbxt8VqCzJNE6F95iI6blUftJeKZrnrepW8BuMhknBLlmjRDo8F1sT9DY6dYt0t2zPGEqTvZGzesgS38kWYUAuEXaA80aAd26skdfXbT6Y4A+UrbNtekE1zcOrf6KhvIuV0G3+tK31diXawSdD9PlGE+Z7Z5M2XVBgeDAalZOawYfOD1S2gKh8XtysCovYTvwj7L5W3KQohfDfyA/1wCUgWcnFO34ylxUVBzvCPKGz/ivvW4ABJh+uxT7C143UX4fY1vugzumT9bvTL4glYFCRqurQdTwzyDLwZtdmBf+4JOMhhowYFSghbdB2FkHkkBQ=</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TifHAIUQziiZRQ/Ro5tBwTlN3LoMszDP+wmAW/2Rx7znYkX/fvAcf/Ka9nnyCRYsm0sDHd+f7+HPL6/Bmc4HuSnxAZLjCCgwd1m+xpZ2aQgYHByFtzs0yQestJxmt2BxqqGU7JHtoVZQVlCXK+crF/b1P09TQe1XRK/uCRKHrXxZ55wIqBsmcmGMbJdRYDpS5Jgm2NDxhTB6PvUgMmEEFy+fHJLcbYXhpioMQNCkPuvvqiG32IfZcGsEHtbbUpU8lPviVPYwKvUQ8OyfSVoAQPNNYN/gG22QQWsQPtrjZBy</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJaaFKh7SqivlasRRMf7f02iaBckDu3/IFLf+6SnV5B9wP0HkEO3UqFY1huL70ByQmlxJPkTfbTeFjrnCp0+GilpzS1u5mORROJH6h/ciBNgnyOK5jLoINabrVeiNqQoGNGNBWZT7kvd0O2gf3ByNcti3Gk62sRDegdV49yP7rxL3kTN6qpJeKPU1vuun6XrSlE9p66tzsg0dhL/+3vtkcj+JGLyr79BBNl6WwekPz0n3zPzZuwNnKiVw4inrJ0twNqGgchxJXIjK7t/omxCH83/kRN2sYiTNC/NXsww/VMSakTZ8GOWXqse+/KfpYcDLH5Lz82ap73on1clon3hvw1R5rZ4DFPjyAKNm1WDDwDBz3igdqXZn7VF+O86LNTq445MewKJ1O/zbZa1iTOnIe38+9DYTvZQgo+r+/r6xKggA3Z5CVnHNpPe6CmXq/ze+2SOrzCfCZ7rYvpCXgMcr1ja2YpcV+EVXtGr//pT6F5C5qhBhBV4zSGm8OqQu9GRK2jF4OZjFleWEZTco7NHrob+p7WvtVp2C6ECRrauwph13CylS0eZwP3bsBEIHWkYttJuQ5EjmSWrHv+DwokZxBRsHvFRmi8ZUsQ5UtynbjSckyXdBq7KPwzEhFSwlih+D9FlStBJlPoF3qpYx3HpHQTSn4E9qPJXj6RczxU2GkYesVA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5Ud+naG+CCdS8v1iq2JcN4vMJkRDJXTctMAmws4lyvXd1NcnhZELus15gHlXXymyQloxomyM2O7yGexgwdHImZMC99QKTLkNAeA178/w4ezlDQIn6bbJvULXXNhCVsof8vVEU2HqIrMIh5V70RNLa9WxO4EDRnNQZ5nAF6JQz0O2pVboXe/nj8av/xTTmWYocPQqaEKVvM1UevJCTsk69RK5OyMoQK/EuXOB7B/RUAQvcdYTyWHVN+2cmBCj5wU3dtF88aOOQfAGAOqm6FxS2Y=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Approve">
      <title v="Duyệt$" e="Approve$$75"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy$" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Undo">
      <title v="Bỏ duyệt$$75" e="Undo$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>