<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m57$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="BPT" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đóng đề nghị thu tiền" e="Customer Payment Request Close"></title>
  <subTitle v="Cập nhật đề nghị thu tiền: đóng, bỏ đóng..." e="Close, Roll Back..."></subTitle>
  <partition table="c57$000000" prime="m57$" inquiry="i57$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="80" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="&Tag;"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tien_nt"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgf9lFENc95FGxH4cNVebk/MsnvWfKSKH/igBEfQoCU6oGH9q04imUEQXHYheFIhwi6Rc285EDg2z37b/D9UDlT6S2jEW18ihnWf3WGbBonq2g=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egcX1kpT/6OsU9X9CKyYGs5W8FG/tU1cEnCatgKHLE0T7fgIeiHW7cceXoTIn3/CsgGVODht1syTpob+XUL4Abhbny2cZ3hKf4owBQI7F+7Iphz9zEsckNsmbq/aCp8k0J9vhdLRFYNEUUS4EwoDm+iNvYdyUYkga0LOeVrlq5AW5oFa48DR5/puSef6QJD8YGKfjVJ66HwCRIR2EZyv13clPmoNGXrzh6z0dDvt8A/Lr4lyrz33y8Sa80L69xDZgXFWyr8dHm3eeSqrvm3OrvAX/5yws8tdSp8nFCuQtOudlBTERUtc4Q92zAAIunIQCoXI9G6zgqRfr94atnLhadd1GKywyxZkQiX4jAIFRtjllujGDdZZ3ogh2Z1FZm7Ww3OA5ntuvb7Ox1Vtj+WoUO75tMrBWd0Tc2f4gMIcSFDwChPTDEcwUY4+rGKQ75PUYroKBwIp5rj01+rYIhj/aS8iBqFQ+fhZCp03wSe7j/RxiFRzOTRU9P12ESTnd9/lN/yjQ5ObxOxWx/EeicDLnf6UXCnrtfh+Q3IzEl8/BoM/jEZJkdjScpA27Kl8IWReWl2POV8bcj8KY/5LFVKyw1IVuU7xmKUAzMJGQ0Rp9VmJpSF7U1FUh5rbtsz3wfr+WFklAsXparh/JMvZstvXG8maVSTiOrqJzuHT8+ppYbreJwFAzIiPoW2klguYrb/+HtsXEknqmpR9yGE7OmqujbTnQe7Kvti+Og24rc2DHQdJyBdN0jxlIA7pW9/rkunOsk0XFaWA55rJtUQS7h/xHKIs0X1vBWjjBg6fLWwwujtZMklHmTzcYZr+PnkWzqPN/b0p040kiudZv/dui2EyqKT5bgcNvRoAvRmfkjJBQI2KfiWnFS3O4CEDIgJEBvorh8H8CPZlB5UVW7ZOnHFnpxgUStVCoAbaEVGFIr5aKHzERJRgVUFv40FdHeMoKF+fsiaPNGo7RBaOdn9HthpbNfC+VWIxWzfB4YwaE26jFuAB3yy4Hz0LPlZfWEHHcM4AbPw==</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrIEuOmSbmiomvj63vhBgT5aBtgdl2xl7+PBnmNVcCN+zRK0sHzn1BmigUWPGjYxpT3q4lpAvEw9J0Hw7aSF/+izhHoCy6O323WQ2Em9j2Z+JCbVaityjwcrh/H+3Ke5LQ=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHsHr8bQEfqUbrQsGv8NCLM6nl+vDHXRwBTncCiRCPlSLufo6+eWwHg6g0TQxwX1q5Wxj3jxQQAPsz0Zuj2XjoQIxkku+R5znsY/KypJFD/MCl2joLOXDzoGq3OhKPBth6LYncNzN7DvPkL3cPwEeagpy1X5MmwLn+2gUhuJszYpm7gO0kEmUmf38SFsdHomzTi9d3wpw5rmzsZr8MZ/zl3Tpu3Nb4ZdZuA5bR1z/GXATYiN8DM2DpmlP/H8abGYSZiB31A/Vzde/yHnrBUUXEx/ddUpxzUlk0Vsxdu95BQCcKl2O2vB+0d9QiY+awSNrmMBFj1DKJj/omd/yF7IunEsU5l/Lhc5JevX4GebTGo/jUqq6DGjZmjMs8mKxETfQRJF5cHOPK0BV2t7awXNaE0RLjfSYDKKhk3WgdTORcAO6zKTi8Qu8ciMc2S5OdCGQyDRkb+D3z+AeMZaJGjMKaJhFySiIngFcYys7HF8Ksfc8SrBcMMQnmNLr9byyu7A4mfPu53KGK9pevdPleCE7GKGEhetqlPhM+A17GbMDQGsjIf3Uh1qSUQTw8bHjgyEKD2LQGIU7MsOnuUcM5M01/bRryCnT1fIFJ6dRdFEHgZQb1x6n9E9bigDS3c1avr5Bekn29qVVhwUlMhPyBHMDu5mLy9Vo5G8UNuyppDsFjgEkRZy6qAe8dCK9BTpfIBbYZmi+QmjDTppk/eXsuaKkMk7nwHVQDJrAnrCd2njDBOHouTYZrzSb92taiv4Wn473lqMtm54lujXynmfV+cPodgzMREZjC1gkYkd7rC3imbBMWSLXG9K6z1x0sPOBRIHNls=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Close">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hj4YK6xbPUPN+hp66TSaVAw23EudGWXdq+Du7Vp+i3505QngT2Jmn4yJXROKLKZT2JYHOqyMhUnkk83xSX3AYl/eKIWTd6IYip6i5veJRKbOYaYHRYKroQfcAajRp/hXhc=</Encrypted>]]>
      </text>
    </action>

    <action id="Undo">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hh6yCNhPuCiLIb1hW7TW65+ki8KGR86oV4bROUPP0+7/0jafX5u0SQhc0ApfF58CV0dArIiUkzOs5uVjnL1fcDepCmAdvmRs9svnp+JfNbHo+2/Dd/OiuwxiuH6Jv9XxHQ=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6SycXjKTM6ycMLJVwbRiKBeDiB7+d5+EXZCGDYuvG8PGnzqXlo8mzQAMq+Cr0wgMPJh7uiXOWRK4KKkZ4j8P4P6H1SMyJabESDYY28UFBF3wb4bhe3AfpQV7wdvvvmiB9jB9jndyMDYVuxIBZvgOjzTmTqEzSWjqrjO5YC+8u4j4Wh0bHG1IxyBdgQcmWeM5FkF9ETV/K5pjBpXksMtCv0tpJvuk4Gg4HCV8RGtEAUVxSpB+Uz54V1yfZbqMyGaNA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Close">
      <title v="Đóng$" e="Close$"></title>
    </button>
    <button command="Undo">
      <title v="Bỏ đóng$$75" e="Roll Back$$75"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>