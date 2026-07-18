<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="ms2$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SF2" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đóng phiếu yêu cầu sản xuất" e="Work Order Close"></title>
  <subTitle v="Cập nhật phiếu yêu cầu sản xuất: đóng, bỏ đóng..." e="Close, Cancel Work Order..."></subTitle>
  <partition table="cs2$000000" prime="ms2$" inquiry="is2$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Thời gian lập" e="Created Time"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" width="100" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_lsx%l" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên yêu cầu sản xuất" e="Work Order Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_yc" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Memo"></header>
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
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="sl_yc"/>
      <field name="dien_giai"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgf9lFENc95FGxH4cNVebk/MsnvWfKSKH/igBEfQoCU6oGH9q04imUEQXHYheFIhwi6Rc285EDg2z37b/D9UDlT6S2jEW18ihnWf3WGbBonq2g=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egcX1kpT/6OsU9X9CKyYGs5W8FG/tU1cEnCatgKHLE0T7fgIeiHW7cceXoTIn3/CsgGVODht1syTpob+XUL4Abhbny2cZ3hKf4owBQI7F+7Iphz9zEsckNsmbq/aCp8k0J9vhdLRFYNEUUS4EwoDm+iNvYdyUYkga0LOeVrlq5AW5oFa48DR5/puSef6QJD8YGKfjVJ66HwCRIR2EZyv13clPmoNGXrzh6z0dDvt8A/Lr4lyrz33y8Sa80L69xDZgXFWyr8dHm3eeSqrvm3OrvAX/5yws8tdSp8nFCuQtOudlBTERUtc4Q92zAAIunIQCoWrMielA5TRGdt7TTiTgSMu9utuKqWirwAllKMepYIZAv1spWdZBfDcd9cbXg58CqqgJK9DBLwk4kNr3XNIb+q4VANeRmrdrMDTascQ+in2hKX1jOo6+jn9KgF/NbHC+8HPdxlym0Be2TIgrelu60K0KeQg9QQd0ihPaK4SYv+kyvQInK4PNen57mdiCWFwwaVXhTmBmYCyVed3fBjjZrvazEgTfYYD/f5dnU+TMwLK4AVi8RoNo/N5JFILSV12Nf+5vu6xTDAIan3rxeZzvraLpFl0nTc4DummXqdtTDGKOUhmgh8gp+MJ4HInuRVwGi222EovXTnTF8jPuHWk9v3bn7GS6/td455sC7aXjGDea5SiPTHiy5FxR31VP25NVv6mmP/dmdXHxHs2o78n/5dmg5Xm49CutEYS1DqZQn6kTa+IdTqI5CeUXsDHA3vF8RCTOiamgZtHGe3qeKvqWpjjBAW0IaunPnQpcJL/DkLACASVnUAB0s2aqPIMEGxRD9+S5LBqXMXR7WN88rU8vNQywwh9BDzX5DT9bFcVBpNp8Fyn2B1Sf5cM1L++aJX1SU/AOYEwyvHmQChgVAZzIGQNf6W6Ik+zbzoPIj9IZetR7FqJsuvaoAszba9coON/U77kVVrwLoqbz7pZE1tL639kgms/YvhGb7X3w97UZs8Dl+LkevvuT+3N8estVR4zW9w==</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqMLgOlszxhc17342ydeWrvFfPeiRfEIMrFfc2qBAjkvQGQGE+P4OSmoT2ygHDoDnU3VYG8qH2Zd2FHfcUq7B8iIim3c9qyyPRFwzJYGXsVEgepBA5gJtb3Ex4sfiqHvGGG5nLT/gqsrExItmzzzhqmgKGi2/d2ZQ2cChbU+XUhD//H6lPHNqIKPrzXBlFPXIS</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJabPsrTjvnx9z04VR7SBXt4Sm5qxKHGQDDOf672kQVDSKSKt3VDgzthlir1uGDn9T+RT8SNmxcQD9+79DiifToMUHl3+9uEZi1p5SDsC23iIT5yUWVu/B/siQfx7o1nsAdfj55d0tvlDrTR1Ec6os+Bkd38Jy0d0sd9Twn1wTc0j0/Yn4fkZW8aiXns20dfOta3JVFh/fGSe7VDpC3aUD/8njD5VK571+S8e3NBOF1oSVEgbwrbIIVtV39N0+npyLz+H+e1sLRsNbuZ205BZnzTZ3VnxzE1KIWo1cCXxZLKeijFNypzkJLDZ2K8AA29qFb6lRL6h1o4FPjNWYm/3KZJJ4ybMZDzJoBDYBzNDBfsISAlDtfqOxOuJGKt1zJzgUOiTVqKh3mM8nCJcsR+K/1wt3Y0if6o6djMTQIlDEwPVgv3HwPsS1RaZIglwvZCQrOGLMeWf/QN7fY/UAfAe6tYr06RT2G8P4WGJ0S9p8PQTNPtbsSV5zzYU9ukgUAcb+f65mJJanPHa2HRG6UBX38M1cnwm99wFAmSeLRrIrhbh0xr/hB+iYVUzcdcymklYHvYLZeypKR7jlhMoQI5L8uTK5TcPrTDUcteuhTAMB2JqmDxK7iadg5zSHsJl69aCtuYQt/pTJ7zK7YKQguGcyq52PF8XRMUvRWD2l368IpUB8tZfSEE8IEwgsQtEdPB5y2m59qGOiu1BQUpNnIV+AuZZQXutLsKEKFo93z5Cf+FY5yf53EWArcqGUVURs+8mY7a/YDAXq2YLVaYkPZ2jZ3rfZMXbsWWXyGLCBS4P/BbKESrgls6hnqoxusxPva//QpDr8hLXcVOBcQWiLdjEK9EX</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Close">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hj4YK6xbPUPN+hp66TSaVAwFcBVQ+BGUszPZNLWIDlams8jflf8d+FI6fdVw+fcePk8hgbeHkMfIh8P/V3SjGUsH8QE7kie45jljsE8jqU9CVbC0Z1G+29XSlSx5izSDxA=</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hh6yCNhPuCiLIb1hW7TW65+lF38pO24ZdYUbLz+QChWOpd31fgp253Q5AhLx5of1mw2glPpC2kfDQ3mXQzJ4rTkCcujDlhesp3j3DijyC3ss21aINqkoUHhpaB5kuvM6J8=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6SycXjKTM6ycMLJVwbRiKBeDiB7+d5+EXZCGDYuvG8PGnzqXlo8mzQAMq+Cr0wgMPJh7uiXOWRK4KKkZ4j8P4PeBYZCwAheDAlbp5qpvIMCsoQbkw9pclkVT/marGHI8j4CJ+6XHYquIZKu6B5NXkJm/PflxrRByJl4KMOb90OaNEZaWlc4lyqpxGtKAQ1Xg8144TmO0DADDSk+FtKPkdEL2GhvDk13WCLXY3OvW0biXdrbW0d+fcUUKwbJmu7T2g==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Close">
      <title v="Đóng$" e="Close$"></title>
    </button>
    <button command="Cancel">
      <title v="Bỏ đóng$$75" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>