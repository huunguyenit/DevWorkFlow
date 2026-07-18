<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY Parameters ", 0, 'tk_no'">
  <!ENTITY UnitTag "dmtk">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;
  <!ENTITY k "tk">
  <!ENTITY Tag "vdmkc">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmkc" code="stt_rec" order="stt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán kết chuyển tự động" e="Closing Transaction"></title>
  <subTitle v="Từ kỳ %s1 đến kỳ %s2 năm %s3." e="Period from %s1 to %s2 year %s3."></subTitle>
  <partition table="vdmkc" prime="vdmkc" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="100" allowFilter="&GridListAllowFilter.Number;" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="loai_kc" type="Decimal" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Loại kc" e="Closing Type"></header>
    </field>
    <field name="tk_no" width="120" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="120" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="loai_kc"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrbLgAPGaCuzvBahu528iCkDAfn5m2M2SeBXHdQL9cgSizGMKFNDGi7kk3OPlHt8YFcs9h9ByoJSgqur3fhcrkxVNednv81RBctG7yXVCyucluohRioW4uxWz3Q65kx8FdV0hfNKizfIQ6uN3uRA+2T40v6NPyCvtIqQ7/jKQOH2Mx4MfwrhTVFap5sOlTHGT6oikbLwm/uvXfRYRZYrPPAGmHMirvz21ju5wxDoNS2DvzJEgl/9J7teJe/brrO2Q2CNH2hbZeQ+U21MknHYnGezeOQU0WubTXlbT4aA5mK9Of+5Ae17nFkjiu1lj35tGDRxB2WmeCE+zJ04CZihz93lAEQIap0QDQLVSspvQ4Uo1j+vrYsSXitHegCPtdtWIZN0OkKaOIcxcjZJgQSXf6XlJOwFLxuyHyE4x2j9ddy2iGLTvzwFHPoAXIyvrIygMcWqor74oIe5gJ8OJq2+i7Txfhd8yx0z9+TJ361sKIyHBHnmOER7uvDhgfI8YPF/wIsSzEmWut/vRy1FMqPsKKXRQZ6jlpqDf5OaTan/tf68Z6vHlJZGsUWCnUa3IbLNFgLPDXG3lKPVycjKvO67phvqqaI+9TA/GWO0Wz+t0X4CzNw6oRB0rUGI4COSuG7H2t/vHKLS5d9zVJfoiy/ZuObdA5JCNRZffutgLIgi4PwJnJ78L++KthSxoLDlSfomfSblcGROU45DmVsBlD3PYDFmN6UZE8UVDDSdfX41pIxDkbch3763TMYe5aJwUdpdQ4EXqObsiTjhAFyoqk/U/xYQCljb3OCIZVvVBbAicKMPrSFdDSA1GbmXSFZC0+FfVBuEYjHKsS88+XK/IeFy6U2MuzWGvs2ZdmunVR5NSHqd7+fFCcWOxx0Ryly5vJD+KiniU9Px9e2ww652JD3sUi+tOiE7aeKg2dHM/Qmq5NhvllR8iRr/Nlsi+2/oCYsplOfPmpgyXe2BSM9/iFfzVEl</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <response>
    <action id="Create">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5A4ZYhLwxbrdPLn2TulXz/IVSjBD5+zHDO5Kcz7R3BCBdk7316TDNNbCFLvcv8IG+nGG0i5bglIWmhki8i3RaYYA4YADjhwSk9vZ6jlq+RLjeLgmDXElbbSJGdfoxsbRcWYb09Bv7kDwLjCDbiSs+gQVoDu82ThwZgUFV0sBSGs831J/wP2/ZxI/WUnNeqCmb2lfGstOIY9QrnetVWyRh7AlhxT7JWCvNBFfs5JSyz5QL/Nnf4MOHk0qL19OHhwKiyEGL0f4NvWvE+tPTSX7VnYVDdQQ+bYDNfYNCWvu9md</Encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5A4ZYhLwxbrdPLn2TulXz+zKGTXCZvGUu/IrAYgTN2+LZFyez82SWVeICQuHdlgmXZVdDNJUspQTwZFaKg6xGCW2QT7SxBrRpQIQhrclRem5N4WIgCiRYl5EHGOwyq5mpYR2dyag9IgdPhu7ARwjYEDS5pPtQ7deJBOfqeWwLh8YbBYR/CEORkqP5s2FLcw/Qs0Tt3fq/D1yDVVXXOFX+fz7kOnS0sfV4oTpa2dzMnoWPKJTFkP0gbhv4W7/QwgF2c+VeMr1eC6M0zbxkXW5C4=</Encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0yDnd20gomSbR9AbNlOnx4X9dVo5CpDKAbfgm/+/sYw3sNOztloOZNr7WCmK8/IyEbCPhQ5UL7PVU1QuN/CUKnzr6LoqPKC2zIjH7SHZv9JMqB7+TPKXwieGTsrT0nJLSjT8qnmWitjK/KtNhtJ0ZcGbWGWrU/FebLHjINmX11KrpnG0KUEyBPVMrN1q5ehV0xX4dQ7gLixS4zkA+8W/olcPquApPDVyCbw6rXVCpJP</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Create">
      <title v="Kết chuyển$$90" e="Create Closing Transaction$$90"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa kết chuyển$$120" e="Delete$"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ$Chọn..." e="Filter$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>