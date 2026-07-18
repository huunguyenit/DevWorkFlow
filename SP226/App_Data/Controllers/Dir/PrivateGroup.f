<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="privategroup" code="id" order="id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm chia sẻ" e="Group"></title>
  <fields>
    <field name="id" isPrimaryKey="true" type="Int32" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nhom" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Nhóm" e="Group"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_nhom" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="user_lst">
      <header v="Danh sách nsd" e="User List"></header>
      <items style="Lookup" controller="UserGroup" key="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and status = '1' and id &lt;&gt; @@userID" check="admin &lt;&gt; 1 and user_yn &lt;&gt; 0"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ma_nhom].Label, [ma_nhom], [id]"/>
      <item value="1100000: [ten_nhom].Label, [ten_nhom]"/>
      <item value="1100000: [user_lst].Label, [user_lst]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI7+AIz0Ztb0iQ3XQACa0vIvlobFGLrPBJ2+TbBgIzBEPjFrWytf9zsJ7Hw+sPG20iWDt68QsQHVxs9Fu8tx3fYIE32nycRsfDY1Sw4cV/4lZ3heYjeipQUohaIFA1lAZFnfTzdDSVp2SQ7kEVv8ipydVlmNGGaq1nZw/TPeekX6PGXILIL18gXBMRPgd1F/qWnUuwglhtppbKsT1sJRn2fDbiFEmmlLDB/pxJ3t8V1lXU8WnAmKEEErF1lu614Uoxw+ZgWdw3r+YS1QmsT7bt2guyAJTRuWEbfnIdsbrBjtQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CX2F1dWkQKRK4lIvqAu9EumTynWP8xJFPPPotYMK2loNIacodcVlU4XfLdHffRWgCVX3KfW0M63cEghcB+Qzs72S0QhfwiMY/rcNLlaTOXNC08l2k2NalMDgOe/0CFCtnRah1pb3bfaIzT2oSShybmLRV5iFT7cwZf9WkGsmztS6jTdCuUZ5xJ+f2joTEI9h7/h4WlJ8Ykpkcv/t8LfQ6SqWQMblNIrExC9ISWKqOCxJh0ZfIISO2YtCJqWy25rkIHGZ06wio3uKoHsp6LpcOqdpkAMrtBv3URtSX2OMCX9JILmC/7lxQ99YiDycCI4vQ</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&3fWeGq8RzWh/NTe1zazZNre/1tYDelZ2lJzSscgBsR8=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqkDUJ5esg9ajT6JCOWQqTUFb8QEXlaRdayAOeMsSFvdSHWizoi0JnJj3tfYHiWkQ+0QcLX6t0OmkH6D5KCoVGLAl2XzKyh7kiwZU6BJaH2QicDFpOIbizdwRT1UmaUH7mjO/PDBOc53/aA8Y4bW56/nl5MR9Dc8MLI9sJJz6wdhRDJu6P7vbskQFiURWH/Y/DQAcGOZ3+OxL1BRN0LV7HpBOItwJnomA2PPKX7I5gnB1yGOmipUUuCz+cZQo4qsEgYdBFPdUGtvs8LNDNmeDKw3CD0ajztXWzxiuFdbxyif1oNfnbe3yXikmuBY1FefX</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&3fWeGq8RzWh/NTe1zazZNre/1tYDelZ2lJzSscgBsR8=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvztezs/Fo7XOM9mm8C6zZZ+gga+IH8antW5i+YiY26/lnYU3MURAgCpGr19EtI6jgL8JghY+RXmO5rw+4uHgnzUBbaGhE8YSG972Bniv14YCM40BXq7yvoDcp//muBrBnIlm</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAntCGM2aaUkiTAcABGLpJBWaXAtg5lBzTiS2ahA7h6qd0w+GL8yXlTPVHPt/PSsGOY5bpojYVE3/I/Lg9iMqikP4NlZ2YDCuE0tdBhsM2rz</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptIrregular;
    </text>
  </script>

</dir>