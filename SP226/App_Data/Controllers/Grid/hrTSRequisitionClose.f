<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H13" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đóng phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Tool &#38; Supply Requisition Close"></title>
  <subTitle v="Cập nhật phiếu yêu cầu cấp phát công cụ, dụng cụ: đóng, bỏ đóng..." e="Close, Cancel Tool &#38; Supply Requisition..."></subTitle>
  <partition table="hriccyccp" prime="hrccyccp" inquiry="hriccyccp" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
    <field name="ma_bp" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên bộ phận" e="Description"></header>
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
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
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
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIqdLOEDlgQ+IORGM+UU7zFmgrogmIy5DGgvZ7F/K+lqPltvxCv21nt1tjaXSbC0tmDIiwGmES2sgQ9HacEKuGRQv7om/fv0mc4HkIDmYmGw/tdpy9I8r+AC5RaYgp9S9CU=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHuK7wBjQPjBdRRTJyzh48zTazdBPMkNufDJTzVfJEWpa7QqpkX9z1PtaputNkBURXRTJBsxyAICjQUUlC4z3E9CNsdsTs4D2WWtD1+htKCUFDW2zWmSelMAERaLxlImTFzCITQhCbRPlstfVWYYLa+0oH1yNlsqKGQSHDMQSrDylop1BcaUnmWwXW9xRsbdJtHqGFQ3pQUAfYKEYNGP5ZsKgDYdDebjfcCdSSDJArDG2qqf4KYRsn897Mtnz43Zut0uFfits09TmyiYkbCIcVAJfCJkp9XBEv6y45+CeKHmDClrKnW6zSYRf2l0j1mYceDeir5elF99zXdMQn3svvkj4qNpXKvnykdXBmp/UP/8REeWXzoXAISnfSGE8HCwKVO5SrCSEtRDqfdTZwSuW3MTuAFe9N1yQTjSd9ASwkcOLAcgMa6g0WEhymCHhTAUELgVJfScnq7SB/7b76L0r+AqadeGWH8QOwHjsttQNkwyrsjmYxR1RF09cV7d6OxvcgUU9v6180edb4AROOMSxvDCNXc7nI5RbAmu7rIFV9jkMvjwvQD8FJyqtLDnox9aAqvEMPZzlyWqejI0O8XRixK/3Nrxgkl0beZ22UYSjOh6vubCtAo05nX7LF7INpLDKysP/t4vSXv+XEdmrFvnP3wpB3b7CmKRYVpJ8F4Mit9IuQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Close">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hj4YK6xbPUPN+hp66TSaVAwO7hRX1fsCbsMwOvQsp/HSrMy00HKL1zn/sPOwTZA8ACiQR0e2oJzuEtDm4Pbk950w76tOLnpxG6xv71tSuXcGhJPIwYFbDL0R3rKAMTm8pk=</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hh6yCNhPuCiLIb1hW7TW65+lNvylqaAd2N9QjAcwbtgl22K+WfPCY0hzRGhIAa0abWkC6NaOia/ijBo6yZgiI8Y8eOMqZT5JzxrBVgiRXr5PZLGd4h/pML6vWEigDBwf6I=</Encrypted>]]>
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