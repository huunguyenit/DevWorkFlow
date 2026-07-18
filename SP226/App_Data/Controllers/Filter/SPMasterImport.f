<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SPMasterImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ImportVoucherScript SYSTEM "..\Include\Javascript\ImportVoucher.txt">
  <!ENTITY ImportVoucherCommand "init$&Identity;$Status(this,' + isnull((select top 1 m_status from dmct where ma_ct = @@id), '0') + ');">
]>

<dir table="m25$000000" code="stt_rec" order="ngay_ct, so_ct" id="HD4" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="status" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 50, 50, 100, 100, 30, 0"/>
      <item value="110000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
      <item value="1100: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwv3wLHXTDVbx2DdB9PPcGaDBXwbv0oh/z6PNxPtXBr0B91Yn0501vvwtUQ50sTOYA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI2eORDT72Joyasi+9OymTT4=</encrypted>]]>&ImportVoucherCommand;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf4ZtdmPP6ZPpKgCGtTMIA/X/0U2LV7Rk7yZH3lsBOrQL</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2tUVkQ8y3uliMiKEQ6HucGu120j0ae/lpaSoz3kdG9lgkiJZC8GZlsdXnEoJhgE0JAqDiyCdPTRupZGp1I6w/SA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouUowfb9IzNFwoIb4AE2X6BQOFBMG8ppA2itWr3xRP5OmWNG+1CPuq6p7YIlBwNhD/LPksz2VAsytoTlGPVxjQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKyVxodbjS6TqvdckLO11+YlAQV2sIB9CrLQ1zvj79C2RpTRj+VptE9YxfRNnGgaeSVWqEnBi14RpLj7Gs50WFaAuIt0zb7EoydM2XSx2gE/M5+z3q3JDfpi8Vlhjb5EGloggQ8w54y44Opr5vqRi2f+9dH/4BAFwUNA5jqMm4rO+Uv079y6uV+Su18rxlXSriiMz0v3920rG8P7+SaMKDapCH7RBqXSI0ym6oXZpUlc4/xwfGcyXgIPomY01ZtF+vKNMMlvmMjUrxPesV4twWbFahlqVnXTf0NpBMl3PQ8nJpyf6Z2h3bMRHVQ1oC3dJI0jNISE3FKq9NtndPsml4HU3DV9AWIwyKDi/1anE4Lv+n2Bq5drR5C0wpeEUmlaPmc2j6sLAsNpQvELM2vn/v2c/Nh16mgxkzI638HDszcOs1w851g3Cv2USNgZkr3TwEXNkMpNKal0bdAOncRmXEa63KkLFxUhfnBvzzXdnLmHl/E7wVTWJUeAcIdgfwZv5+CZX5jQ7EEUhhr4J8O99zdM</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &UploadScript;
      &ImportVoucherScript;
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>