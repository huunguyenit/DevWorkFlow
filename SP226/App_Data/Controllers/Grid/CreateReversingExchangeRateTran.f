<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY Filter ", '&amp;' + char(255) + ';dbo.ff_Inlist(tk, ''' + @c + ''') = 1' as filter">
  <!ENTITY UnitTag "dmtk">
  <!ENTITY UnitResult "case when @q = '' then '' else ' and (' + @q + ')' end">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;

  <!ENTITY UnitFilter "@@0">
  <!ENTITY UnitQuery "select '&amp;' + char(255) + ';' as value">

  %Control.Unit.Ignore;
  <!ENTITY k "tk">
  <!ENTITY Tag "vdmcltg">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmcltg" code="stt_rec" order="stt" filter="@@1&UnitFilter;" initialize="declare @c varchar(512); select @c = replace(rtrim(val), '''', '') from options where name = 'm_ds_tk_dao'; &UnitQuery;&Filter;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán đảo chênh lệch tỷ giá" e="Reversing Exchange Rate Transaction"></title>
  <subTitle v="Kỳ %s1 năm %s2." e="Period %s1 year %s2."></subTitle>
  <partition table="vdmcltg" prime="vdmcltg" inquiry="" field="" expression="''" increase="{0}" default=""/>

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
    <field name="tk" width="100" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_cltg" width="120" allowSorting="true" allowFilter="true">
      <header v="Tk chênh lệch" e="Ex.Rate Difference Acct."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="tk_cltg"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrbLgAPGaCuzvBahu528iCkDAfn5m2M2SeBXHdQL9cgSizGMKFNDGi7kk3OPlHt8YFcs9h9ByoJSgqur3fhcrkxkMgSAEOfry3r0M9o5ggNPLGq1aLj4j75Dcc2abC1mDWbVm/v0Iu3V2/zLMiVLgEnV4SE0ugcKZZUfPE4GV16yk00gMKxNt9GqovMZSEAz7ScFCq47nEJNd2fcIUL0IpBgeqzHkjFGc2qM4jWKaSWbhriGt1wm477X3CzIXiZEL0QXAYpk4tz9STn1FvGNvWegon9oXbzjI6YX1eCWFeR2c6nURoDJMHwem4o9rEgNNpnaItjAU4mw7ccVk11K5/KHv8KidGypZVr8P9rsLLWQXG4wAK9qAEdmcjec/FeQ3Q1dawB3Xu+2ApLvHLrPZpjrSs8Y7UZFaHLQQneFhQtD3YOHbopPOEJ1XB2+7GA/wibXRm7PugXt4fVvDcvhhlaQ4/FcIx0D16kMm1iEccyVRRbH1Bzw3MyySB+a/VkF7I5FjJoohcpI7+CuI7Hwc5FKYCafl2HSOlEvjreo7aoMBs7D1rJrSfX/lfkF8lzNNB26XLcli1tKa1kbB8x+hwbm3jrc6och1Dx0C7S9IwcnSeXfQh/Gs9saYh2Pa30myBnPHGhkl53wDD6QXeSgGARqJhz22pIAqPhjG7IO+vdxyBCSpwmZHLuoAZtaQIwlJ18ghueDN63KLn8dMKRN80HHNbrDnzbfdrmgpLZO3p8AyxQUtY8lcc9J+cog0L89g9NxXHRzRWle6cnyNmQYBf8z8vvz72H7WvCeRvlRn1FbgxwP2MTSOjen3hiUWxEpu8tUEDL+GnmgZluQ6FjgXWm4oNzDTFe7N2bW88dmz/jnjre3jZI+AFaX4P8EVDu+8snhp0IhDTvSQmgjyM0B7YKsZsP93HZ96mIUL6Arqfi11NO5cFTNWR+2goeRtyBTuw=</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <response>

    <action id="Create">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+CgukOKygcTKhFKX3Le81OtqdEPKKdQJKEob/EPmw8c3tGvQ8RPw8RCvHgXVDov9G+Z/uD5wRkMWXzLt7p/RHJKsdaiu38iq6HxuNhw661BlpEfzO3FDuAUtiLwuNrn6qYIh/MGgI3WngMYUpnu27lEMbJLTkP0dGnRBhe/q5yKqpwTciM5RCbAyE/35G0ekeMhh0TkbwO9O/uRTUMhEbPsiHQRMDlz77zRtUO9l5cgO2nvRgwrEFxE/ygqCF0ZMIykR6qLpCx7LVZXM2i+SebwSqcKO2FZynKXcnSiMtDs</Encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+CgukOKygcTKhFKX3Le81NY/nnefV1EzYwBki+42XG53PpXkfTNc+wxXrAVYg6Jg8vaBcjSn5/JMH3BlGuiz1R8OmC0Iv2sA72a0FgGhoerHSPx62YvPmhqK5QBIQmu3vjAPDCwhqBcc8mK5cu0lH7aO18fCgWHHM1Xr0Wp7v9Cske8nVY/m7cll8UuMESW2cWpTu2fhVyX072RekBLlEBrCyR5NePV+7IiqFfUs61IltJs/S9fhGkosvAKmjRSaKfVVVlYx9qFo7eVzd0uaAw=</Encrypted>]]>
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
      <title v="Tạo bút toán đảo$$120" e="Create$"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa bút toán đảo$$120" e="Delete$"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ$Chọn..." e="Filter$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>