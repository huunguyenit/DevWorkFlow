<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UnitConversion SYSTEM "..\Include\UnitConversion.ent">
  %UnitConversion;
]>

<dir table="dmqddvt" code="ma_vt, dvt" order="ma_vt, dvt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quy đổi đơn vị tính" e="Unit Conversion"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="ItemUOMConversion" reference="ten_vt%l" key="1 = 1" check="1 = 1" information="ma_vt$vdmvtdvt.ten_vt%l" new="Item"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ORRbhYkrCv+6l5U+yFVAOBjRoQM356ZhKpVEW1R2DR48tlE1mdYPtBAL/b2IKYpOQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="&CoefficientInputFormat;">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOM" reference="ten_dvt%l" key="status = '1'" check="1 = 1" information="dvt$dmdvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="ten_hs" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvt1" readOnly="true" external="true" defaultValue="''" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="1101: [he_so].Label, [he_so], [ten_hs]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0OXoH0HfNPEqH8KUgdpXhyq+9azIzQ0ZYoKaUnjSeu3CPTj4vfL4JAn8WtZyuybdgrDqF+Jr/7Ui2Alb/+VwqozKsjbycIGIncoljZfAX6c/k4haAAYkBzaPLrbr4T4kP5X0D9BR5uoaECaDTPpdy9osrspcpRu9+uFgU8GZuKLapQv9cAljHu42u+7mLVX6e5VEd2AMoa0clraRqsAtuctjXdGlG1akJ48n6WFIkYVq0luYIm4dBQWLQAQcHRA9sq2beWH3I3gsuIVKX5wQUoc1Y66B6gCc17+fF9VlzZaZlM2fxvXcMKuvwZMytOl2u/X9rthy0W4xUkUzZ8XgW14D+LeASy/Y1Iax2/n0DskGbew7oLX/hxUSMIQax4jM6uR9ECsnHaTwaQXFsrT9iklQldp5y5SQ7VW72JaBPGOtXJB8XsaLqcFZHxcCjcZDBFyQsj7EHrdHTCDQW/ZiBGOKWwtt3t3k/bX9PKOHs2eaNwGfXu8vteyM3WLebPKS5M=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA4OJ23g3oDTvlC7fqNRHP4bGUwM2bXWP1tkxKI8iwtHh29bQCeuqvTdGFkSJTjyGQTXdeY/PVzaRDRmoByVakQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFVF0BImxgAjoFMc1SfyWR/OGDuzC2Y7/7Fh4Q7bN+PK7ZabteJyh/pP4RQhVmieoh/sgxQ+gWcfZ1NUYKGdoy4=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA4OJ23g3oDTvlC7fqNRHP4bGUwM2bXWP1tkxKI8iwtHh29bQCeuqvTdGFkSJTjyGQTXdeY/PVzaRDRmoByVakQ=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07P2Un7+3QoEkZfyDOMf3jNLsSZqcwe9JhqNnkQFnLsW4qmvhRYbyJv0rzX0uc1CZdXF2JXxmCiHddpj4A6a0iGPxhsirkRVLUKUcWXGp95CU=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &UnitConversionBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CyUQUWk7zJnsAS2kwo+S8erLgTCtrFyuIHbKNyf3e1Tp/K0eKkY4+aMC2zsj5EGV9oowx4yaH4+TWW9IHQO/EDmfOsQv+Oyw0BokGbUOdU59xncl0wKtC/076lx/9TRkV7bJsMFUFfYH0v0RDJ+8xi1uZcxLKLpFD12B3fHhe0Ew/mSGVP2Etx8QSbUmnDKdNQ6uw+mnMxXPSZ+muwN++dokLlLSgkOpA+m+OhA2GV2A08pLCsh/xUR1pMvhUIUmmHfgMWa74Z8q37Ls4VAzzJw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMPL7xtGEW7rN2cdJfqeHQg62qTbP9nwAbRGGU/0AX9UiNlAjezm5x+/qyKZVCz6WX5/zdKtn7KQ4za28nSvpQQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &UnitConversionBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteHlGXOM4Uz6EJnTQeSpNK1jWQCEcMsSOKEDvgpBE67EDz7EwL2E4NvMHCr55nPQq1Z+tseVX0zzwL8lHVKqUvFmyyT/Po+o9cRrwX3ciBUROsvFPCq0qwK69YB0vrpzR184J+9LNHh2PEBfDyePio4y0I5yuuOi7F7cdvzZfNNXwlWVXNPKn3mbmBtJ/E1t2DPjah54LAKGjL3JXHonWLtwawhli9mzU1ampVPDhF14eIG7lcSxMOA6Ncb9ds4N9754v+uXYJBLklzdxxMwxoIKssfFL/u5CIoOD+TyNOHf1uzeSeT13v5OHU2i4ye+mxRma5wlwMXp+5+cK99yZKTiHtJ4MKbzramjh1F7du7w3hB2aaI1MWUs2R7VmjWHT6</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+DsAOnFycFwSho07PjXu7A1BidXVWLrZrbtJ5SfENxIkKjgmJB6Y7xYapT81cL7hUXRlaQePUn8t1xZgtCwZNM=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6oCzsk4OOFIgLRX4EJj66112nwPfzsScNQZKVyd4wKOBZljsR0a1rsce8ebOCqnkAIHezwTcWViQZnmau8FVo/bfHvi+2W6LmXu0KL05jnQkBrjfqxaGfd+27J59CtrF2Qmt4jiOaNUYEhQrOOSwUv5zoqCErEI5F5ZFLmsIPoqy0ucOydc8InywVR9hjNBR0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtavsrSb8tAIxu3bG6wo48u2R0E+7VuU9OWtMNyXCngARuP1Nc64Sz40bXp/GcBgNIazK+0M/Fw75Wo8PTlIS1qeRueqEPoy78l+7ZPqDuly1pxbDxjT6cPvUm5D2hJE0o5/0s38dSDAQCwJa/ibZ+DnjdFu+Ckdr1fnk+zW4SkhfDNx7W0jLRKGjaTQ3bJvy6GDP9pTsPo6zApMov9x6o5dRdYEgwVIWv3ZNVbB4fmRIsajlolNfsHYPN4RFNZ2GJXAEkdJ/C2Cm/l30lIBWLxoBkqjjLZKyrJXFY60DLYmU+/IIqNSl1JDF4g60O9xbmtTVIFYAupgc4yHhobdoeFxKDMUGDzLWjY/05elvTtnZnjxQAboH2o1phTFDDB63XXRfy9mztrTe69NYvz0e3LDlUUv2zRo9vcQOLQmHAo0dIdtTsn5auOugO8FgkERIndUq0eARCCLBldW8jzgFkKMy7J/UnzaX2tAVM8fhrlVA</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUnitConversionItemInformation">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4irk52lFsekpN1nmGstPFEDnP8YIFd/fRjRs313fbwtP4lqt4XTEZGQonjfS1IWtcKF7iP2R5UTEWmoHGOKowOopyabh7ZtqhMKz70jGznnA==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>