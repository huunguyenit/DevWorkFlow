<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PSInvoiceImport">
  <!ENTITY DetailTable "d72">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn mua hàng nhập khẩu" e="Import Purchase Invoice"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVm5Ou6fR7iCNVZ6RB7O/yDIe2gXVITH8pO8JBar+axPU</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+NTFmCmyZ30bDyY5tCAhxTTjhLlI3jRKlTtZ6AU5cntXdu5GF0FZfWd3KBP6tw/084kvjsqc7IGRMfs3AZY444IJy9PgdukfPKJOTDrT05MnhkC2PbyRAMqOzBVHJeTKgTvFxfjlk7MrWjHV1/8MtKwas5pY+AhejkopeEyh2/HwDM3RlTFH5wDK1v30J9MInWpDKXtft2tHz5BIErqicvaLA+wHX8QbcJ45ZVKEbxl20MaDsAsHlWlV0HsBLvM91pK2o8KI4UztKoWh9Y3dju2JFzTrXOnnbNpCsw4cw3owEqDE6vg7niNOl6I22frc6ttcrVYFFphx3KGjMb9QIUG8gM5VSVM1t7vdwrYnuvmVyZImfrc0WDdyNXerqB5yUvL2Ltja+KDbI2P7i2+mNvBvNg8KR6Nh4MZoutP/WrCPDs1S2m85R+dsqHxQF1LooFAV7rnT0x1J1MjI0U8brsg==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfsCVQmH3PxjKSFVAXSasalzWm2HUyYlDN5jVi/IjF0DGY9iJSrF1zUbk+A770odSGCw7VPcG5Pp7TpdN6qYFBKJOJS11HF4nZ6CnCLa9D3IiN7wE4DrRp3mYDWkdnycBjSZYsArPHPI5uTf+UFVESgn9AFFO/444yPozOL43SOe4td2OzJXGjBVqr2bTTtagHV5OUKC5Levww8VAZd5zFzLuSuLWkcUWYE0G3TQh1Zsk7Z1cFsVu2J7iYOwv6CbP1xT7qCaojSFXU0+jNblgT9sM1mb0TnYa0fsL1txfxOgkDX0HlYE9PNp1Og7Btd5rIwks8E3OKbZogCYaRcjAALDeMbFYqeSD8UiFD6YDwzBzTYvmxclwCDOeX4A6hNfb/WK1+NRL90/aSDrSiq5sk92kfYkT4ZWlcBj+eRcounPIiyUaNZHwJZXwIiynoI9GoxoQc0JD07tP/VhCL9BLtiTGA6noaYV1DhlA3J1zUZQgC8UZwWjbrJJj01K+hyfXSiMG+GsW0sKYuHMQF15c7pubySGcKX9qJam55ZL0rHQP8w9LAConEr+W3HFEMX5zttDJR5/Cz56/74W2Se7oVrnTDAs64FgQZf7dUjy34+jiFBIa2407BfNsQV+btxHR/SoJ0QZqCpPnsZ2dUqu2z0um7E0lx1EMNIS7ASYJTvPDe4t+cJ1iKfPKb7IGTiSPbMLpE4gtzZn8ybRFCqJcZgcUVksFEHtrkEsLxomHh3NQ4F1dtIQOysoRydpM9dWzLKKi+4xBdgSar2hOTWA0NTcGX4WQ8h5Ga/6omkNAs9YMKXnYTaq9heX8PNA6Jn5PFUEGNCHlj6GI4wHKvIXlsTuctNvaAK5LcGu2+RyT85Q510G7kK/Y8UWXLmNrfJIHJZTGQJzMlQdySsgNR2+04rYUjtxzARhXcKTQoGGEfoDJ0xYiR/lhR8rRMew1bIaj1XakIOhPJ/XpKr/RYmNWPwAk4hf4g/uVSnR178g/2nTAllhyc+xboHCpgjVlO8dFHC4hDULq1493uzayP9m6HV7Zv3EsFNvxpgs//z8RpyWxW4iS0K5AhnGR97iYiYcOEVXadU9Szr/ZRUa24unwiOA8b4hGhkbkUUMK/72X0ZEBb6eO0K34wgWFZHMjL8GWyBLZwXqj/gjTpFF4ZFpJN822BabQxoOEC5deflb9yPUZ4Dbeyq1pzPGhBTaXnidDUq/qTHx7ab4M57cyLrUhw8</encrypted>]]>
    </text>
  </script>
</dir>